# umi-plugin-panel-tabs

[![NPM version](https://img.shields.io/npm/v/umi-plugin-panel-tabs.svg?style=flat)](https://npmjs.org/package/umi-plugin-panel-tabs) [![NPM downloads](http://img.shields.io/npm/dm/umi-plugin-panel-tabs.svg?style=flat)](https://npmjs.org/package/umi-plugin-panel-tabs)

## 如何使用

安装依赖即可, 以`umi-plugin`开头的插件会被自动加载

## 配置项

在 config/config.ts - defineConfig 方法中进行配置

```js
export default defineConfig({
  panelTab: {
    use404: true,
    useAuth: true,
    autoI18n: true,
    tabsLimit: 10,
    tabsLimitWait: 500,
    tabsLimitWarnTitle: '提示',
    tabsLimitWarnContent: '您当前打开页面过多, 请关闭不使用的页面以减少卡顿!',
  },
});
```

| 配置项                  | 类型      | 默认值                        | 说明                                             |
|----------------------|---------|----------------------------|------------------------------------------------|
| use404               | boolean | true                       | 使用内置的 404 页面, 该页面会在 tab 中显示                    |
| useAuth              | boolean | false                      | 使用内置的 403 页面, 加载内置的权限判断 wrapper, 该页面会在 tab 中显示 |
| autoI18n             | boolean | true                       | 自动开启国际化, 仅当ant-design-pro的locale不为false且不为空时生效 |
| tabsLimit            | number  | 10                         | 用户打开多少页签时弹出提示                                  |
| tabsLimitWait        | number  | 500                        | 页签数量检查防抖时间, 如果一次弹出了多个提示框, 可以适当延长此时间, 单位毫秒      |
| tabsLimitWarnTitle   | string  | 提示                         | [国际化配置优先] 页签数量超限弹窗的标题                          |
| tabsLimitWarnContent | string  | 您当前打开页面过多, 请关闭不使用的页面以减少卡顿! | [国际化配置优先] 页签数量超限弹窗的内容                          |

## 国际化配置项

| 国际化配置key                      | 国际化配置value                 |
|-------------------------------|----------------------------|
| panelTab.403.subTitle         | 抱歉，你无权访问该页面                |
| panelTab.404.subTitle         | 抱歉，您访问的页面不存在               |
| panelTab.closePage            | 关闭页面                       |
| panelTab.close                | 关闭                         |
| panelTab.closeOther           | 关闭其他                       |
| panelTab.closeAll             | 关闭所有                       |
| panelTab.refresh              | 刷新                         |
| panelTab.tabsLimitWarnTitle   | 提示                         |
| panelTab.tabsLimitWarnContent | 您当前打开页面过多, 请关闭不使用的页面以减少卡顿! |


## 额外的配置项

在`config/route.ts`中所有具有 name 属性的路由默认都会在标签页中显示, 如果不希望在标签也中出现此路由有两种方式:

1. 移除 route 中此路由配置的 name 属性
2. 在该路由中配置属性`hideInPanelTab`, 将其设置为`true`, 此路由就不会在标签页中显示
3. 如果开启了国际化, 下方路由的name即为国际化配置的key, 请按需配置, 未找到国际化配置默认显示中文(固定中文不可修改)

```js
export default [
  {
    path: '/welcome',
    name: 'welcome',
    icon: 'smile',
    component: './Welcome',
    hideInPanelTab: true,
  },
];
```
## 常见问题

Q: 配置后标签栏位置出现了偏移

A: 请在app.tsx的layout方法中添加 `disableContentMargin: true` 配置

## LICENSE

MIT
