# 🍜 Nebula-Order 校园点餐系统

一个基于 Spring Boot + Vue3 + UniApp 的校园食堂点餐系统，支持商家管理端和用户小程序端。

## 📋 项目简介

本项目是一个完整的校园点餐解决方案，包含以下三个子系统：

- **Admin-Shop(Vue)** - 商家管理后台（Vue3 + Element Plus）
- **Client-Customer(Uniapp)** - 用户端小程序（UniApp + Vue3）
- **Server-SpringBoot** - 后端服务（Spring Boot 3.2 + MyBatis）

## 🛠️ 技术栈

### 后端
- Java 21
- Spring Boot 3.2.5
- MyBatis 3.0.3
- MySQL 8.0
- Lombok
- FastJSON

### 管理端前端
- Vue 3.4
- TypeScript 5.4
- Element Plus 2.7
- Pinia（状态管理）
- ECharts 5.5（数据可视化）
- Axios
- Vite 5

### 用户端（小程序）
- UniApp
- Vue 3.3
- Pinia
- Vue I18n（国际化）
- 支持微信/支付宝/百度/抖音等多端

## 📁 项目结构

```
├── Admin-Shop(Vue)/          # 商家管理后台
│   └── src/
│       ├── api/              # API 接口
│       ├── components/       # 公共组件
│       ├── store/            # 状态管理
│       ├── views/            # 页面视图
│       └── utils/            # 工具函数
├── Client-Customer(Uniapp)/  # 用户端小程序
│   └── src/
├── Server-SpringBoot/        # 后端服务
│   ├── Common/               # 公共模块
│   ├── DataObject/           # 数据对象
│   └── Server/               # 主服务模块
├── SQL/                      # 数据库脚本
│   └── cam-order.sql
└── 文档/                     # 项目文档
```

## 🗄️ 数据库设计

系统包含以下核心数据表：

| 表名 | 说明 |
|------|------|
| employee | 员工表 |
| window | 窗口表 |
| category | 分类表 |
| dish | 菜品表 |
| dish_flavor | 菜品口味表 |
| setmeal | 套餐表 |
| cart | 购物车 |
| order | 订单表 |
| address_book | 地址簿 |

## 🚀 快速开始

### 环境要求

- JDK 21+
- Node.js 18+
- MySQL 8.0+
- Maven 3.8+

### 1. 数据库初始化

```bash
# 创建数据库并导入 SQL 脚本
mysql -u root -p < SQL/cam-order.sql
```

### 2. 启动后端服务

```bash
cd Server-SpringBoot
mvn clean install
mvn spring-boot:run -pl Server
```

### 3. 启动管理端

```bash
cd Admin-Shop(Vue)
npm install
npm run dev
```

### 4. 启动用户端（微信小程序）

```bash
cd Client-Customer(Uniapp)
npm install
npm run dev:mp-weixin
```

## ✨ 功能特性

### 管理端
- 员工管理（添加、编辑、禁用）
- 窗口管理
- 分类管理
- 菜品管理（含口味设置）
- 套餐管理
- 订单管理
- 数据统计与可视化

### 用户端
- 浏览菜品/套餐
- 购物车功能
- 下单支付
- 地址管理
- 订单查询
- 多语言支持

## 📄 License

MIT License
