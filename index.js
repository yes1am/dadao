const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');
const process = require('process');
const filePath = './tmp.json';   //  文件名
const person = 'auxt';  // 豆瓣作者
const url = (num) => `https://www.douban.com/people/${person}/statuses?p=${num}`;
const maxPage = 500;
const baseData = require('./base.json');
const lastDate = baseData[0].time;

const cookie = process.argv[2];

let isLogined = true;

if(!cookie) {
  console.log('没有 cookie ');
  return;
}

async function sleep(seconds) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, seconds * 1000);
  })
}

async function crawlPage(pageNum) {
  if( pageNum >= maxPage) {
    console.log(`已达到最大 page: ${maxPage}`);
    return;
  }
  console.log(`抓取 ${pageNum} 开始 \n`);
  if(pageNum > 1) {
    fs.writeFileSync(filePath, ',', { flag: 'a' });  // 数组间逗号
  }
  await sleep(2);
  try {
    const response = await axios.get(url(pageNum), {
      headers: {
        // TODO: 填入豆瓣 Cookie
        Cookie: cookie,
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36"
      }
    })
    const { data } = response;
    const $ = cheerio.load(data);

    // 存在登录框
    const isNotLogin = $('.login-wrap');
    if(isNotLogin.length) {
      isLogined = false;
      console.log('没登录');
      return
    }
    const streamItems = $('.stream-items');

    const results = [];
    let items = streamItems.find('.new-status');
    if(!items.length) {
      console.log(`没有了, 最大页数: ${pageNum}`);
      return;
    }

    // 是否请求到上次请求的时间点
    let isReachLastDate = false;

    items = items.filter((index, item) => {
      /**
       * note: 日记
       * group/topic: 小组讨论
       * undefined: 动态
       */
      const isDynamicState = !$(item).data('atype');  // 过滤动态
      const isReshare = $(item).find('.reshared_by').length;  // 过滤转发
      return isDynamicState && !isReshare;   //  过滤出动态, 且非转发的部分
    })

    items.each((index, item) => {
      const urlEle = $(item).find('.mod .hd');
      const url = urlEle ? urlEle.data('status-url') : '';

      const timeEle = $(item).find('.actions .created_at');
      const time = timeEle ? timeEle.attr('title') : '';

      const sayingEle = $(item).find('.status-saying p');
      const saying = sayingEle ? sayingEle.text() : '';

      if(time && new Date(time) <= new Date(lastDate)) {
        isReachLastDate = true;
        return;
      }

      if(!url || !time || !saying) {
        return;
      }

      results.push({
        url,
        time,
        saying
      })
    })
    fs.writeFileSync(filePath, JSON.stringify(results, null, 2), { flag: 'a' });
    console.log(`写入第 ${pageNum} 页成功 \n`);
    if(!isReachLastDate) {
      await crawlPage(pageNum + 1);
    }
  } catch (e) {
    console.log(`第 ${pageNum} 页出错了`, e);
  }
  console.log(`抓取 ${pageNum} 结束 \n`);
}

// 将分页请求数据的二维数组，整理成一维
async function convertToSimpleArray() {
  let data = fs.readFileSync(filePath, { encoding: 'utf8'});
  data = JSON.parse(data);
  data = data.filter(item => !!item.length)
  const result = [];
  data.forEach(item => {
    result.push(...item);
  })

  fs.writeFileSync(filePath, JSON.stringify(result, null, 2));
  console.log('写入成功');
}

const ejs = require('ejs');
async function generateHtml() {
  const tmpStr = fs.readFileSync('./index.tpl', { encoding: 'utf8'}).toString();
  let sayings = fs.readFileSync(filePath, { encoding: 'utf8'})
  sayings = JSON.parse(sayings);
  sayings = sayings.concat(baseData)
  fs.writeFileSync('./base.json', JSON.stringify(sayings, null, 2))

  const html = ejs.render(tmpStr, {
    sayings,
    title: '大岛',
    date: new Date().toLocaleString(),
    isLogined,
  });
  fs.writeFileSync('./index.html', html);
}

async function main() {
  // 清空 tmp.json
  fs.writeFileSync(filePath, '');
  fs.writeFileSync(filePath, '[', { flag: 'a'});  // 数组的 [
  await crawlPage(1);
  fs.writeFileSync(filePath, ']', { flag: 'a'});  // 数组的 ]
  convertToSimpleArray();
  generateHtml();
}

// TODO: 程序入口
main();