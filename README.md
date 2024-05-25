# 【蓁奕科技】开发规范

### UAT服务器地址

`https://apps.zhenyi.tech/jt`(未部署)

### 注意事项

1. 安装zerotier，需要安装才能访问内网资源[官网地址](https://www.zerotier.com/download/)
1. zerotier加入网络(Network ID)`e26ff13e35c02360`，自己的id发群里。授权通过后可以访问内网资源
1. **VPN** proxy：host`192.168.50.111`，port`7890`
1. controller不实现具体业务
1. 所有业务在serviceImp实现
1. 所有方法，接口类均需编写注释
1. 所有数据库字段均需编写注释
1. 配置存放于配置中心（nacos），地址`192.168.50.199`
1. 数据库`192.168.50.111:9306/tanjing`,`tanjing`,`Tanjing@#001`
1. SaToken。[官网地址](https://sa-token.cc/index.html)
1. x-file-storage，文件存储。[官网地址](https://gitee.com/dromara/x-file-storage)
1. MinoIO地址`https://apps.zhenyi.tech/res/`


### 分支介绍

- **master** 主分支：每次发版更新
- **release** 发布分支：完成开发pr到`release`分支，测试基于`release`分支验证。
- **dev** 开发分支
- **feat** 新属性分支：从`master`拉取，完成开发pr`release`分支


### 开发流程

1. 每日/每次开发前拉取`master`/`release`分支
1. 统一在`dev`分支开发，开发完成pr`release`分支。
1. 每日/每次完成开发提交代码。 
1. 提交内容规范详见下节。
1. 遇到冲突重新拉取代码并处理重复，重新pr。**切勿自行合并代码**
1. 完成`功能`/`模块`pr到`release`
1. `周二`、`周四`、`周六`完成开发,`项目组长`pr到正式仓库


### 提交内容规范

- chore - 构建过程或辅助工具的变动
- feat - 新功能 feature
- fix - 修复 bug
- docs - 文档注释
- style - 代码格式(不影响代码运行的变动)
- refactor - 重构、优化(既不增加新功能，也不是修复bug)
- perf - 性能优化
- test - 增加测试
- revert - 回退
- build - 打包


如
`feat: 增加了小程序模板消息相关功能`
`chore: 订单模块增加备注字段`

### java目录结构

- com.zhenyi.app.`projectname`.biz
  - core
      - service
  - order（订单）
      - controller
      - service
  - user（用户）
    - controller
    - service
  - invite（邀请）
  - acticity（活动）
  - coupon（优惠券）
  - comment（评论）
  - post（帖子）
  - album(相册)


### 数据库

1. 数据库调整统一生成ddl，存放于sql目录，20240522.sql
