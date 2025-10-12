# 五岳智游数据可视化项目

## 项目概述

**五岳旅游项目** 是一个基于 Web 的应用，旨在收集、分析并可视化中国五岳（泰山、华山、衡山、恒山、嵩山）的旅游数据。  
系统提供从 2015 年至 2025 年的月度旅游人数和收入统计，以及年度山高和植被覆盖率动态数据的可视化洞察。  

- **开始日期**: 2025 年 9 月  
- **当前版本**: 1.0.0  
- **最后更新**: 2025 年 9 月 13 日  

## 项目目标

1. 收集并存储五岳旅游数据，按月统计游客人数和收入，按年统计山高和植被覆盖率。  
2. 开发交互式仪表盘，通过图表和地图可视化数据趋势。  
3. 系统可扩展、可维护，前后端分离架构。  
4. 为未来的数据分析和扩展（新增指标或山脉）奠定基础。  

## 技术栈

- **后端**: Laravel 12 + Pest 测试框架  
- **前端**: Vue.js + Vite  
- **数据库**: MySQL (`wuyue_data_warehouse`，字符集 `utf8mb4`)  
- **版本控制**: Git  
- **开发工具**: Composer, pnpm, PHP Artisan, Vite  
- **部署**: 待定（Docker 或共享主机）  

## 目录结构

```text
wuyue-tourism-project/
├── backend/                  # Laravel 后端
│   ├── app/
│   ├── bootstrap/
│   ├── config/
│   ├── database/
│   ├── public/
│   ├── resources/
│   ├── routes/
│   ├── storage/
│   ├── tests/
│   ├── vendor/
│   ├── .env
│   ├── artisan
│   └── composer.json
├── docs/                     # 项目文档
│   ├── API文档.md
│   ├── 数据库设计.md
├── frontend-admin/           # 管理员前端
│   ├── public/
│   ├── src/
│   ├── package.json
│   └── vite.config.js
├── frontend-dashboard/       # 仪表盘前端
│   ├── public/
│   ├── src/
│   ├── package.json
│   └── vite.config.js
├── tests/                    # 测试脚本
├── README.md                 # 项目介绍
└── .gitignore                # 根目录忽略文件
```



## 安装与设置

### 前置条件

- PHP 8.2 或更高版本
- Composer
- Node.js 和 npm
- MySQL 服务器
- Git

### 后端安装

1. 克隆后端仓库：

   - ~~~bash
     git clone <backend-repo-url> backend
     cd backend
     ~~~

2. 安装依赖：

   - ~~~te
     composer install
     ~~~

3. 复制 `.env.example` 为 `.env` 并配置数据库：

   - ~~~bash
     cp .env.example .env
     ~~~

   - ~~~tex
     DB_CONNECTION=mysql
     DB_HOST=127.0.0.1
     DB_PORT=3306
     DB_DATABASE=wuyue_data_warehouse
     DB_USERNAME=root
     DB_PASSWORD=123456
     ~~~

4. 运行迁移和种子文件：

   - ~~~bash
     php artisan migrate
     
     php artisan db:seed --class=AdminSeeder
     php artisan db:seed --class=MountainIdSeeder
     php artisan db:seed --class=MonthlyTouristStatsSeeder
     php artisan db:seed --class=AnnualStatsSeeder
     php artisan db:seed --class=FlylineCenterPointsSeeder
      
     ~~~

5. 启动开发服务器：

   - ~~~bash
     php artisan serve
     ~~~



### 前端安装

1. 克隆后端仓库：

   - ~~~bash
     git clone <frontend-dashboard-url> frontend-dashboard
     git clone <frontend-admin-url> frontend-admin
     ~~~

2. 安装依赖：

   - ~~~bash
     cd frontend-dashboard
     pnpm install
     pnpm dev
     
     cd ../frontend-admin
     pnpm install
     pnpm dev
     ~~~

3. 复制 `.env.example` 为 `.env` 并配置数据库：

   - ~~~bash
     http://localhost:8000
     ~~~



## 使用方法

- **仪表盘**: 查看月度旅游人数、收入，年度山高和植被覆盖率的大数据可视化仪表盘。
- **数据管理**: 通过管理员前端 (`frontend-admin`) 管理数据。
- **自定义**: 可修改 `frontend-dashboard/src/` 和 `frontend-admin/src/` 的 Vue 组件进行 UI 更改。

## 未来改进

- 实时数据更新
- 集成机器学习预测分析
- 支持多语言界面
- 增强安全性和用户认证

## 联系方式

- **作者**: 王腾飞
- **邮箱**: 2937424102@qq.com
- **GitHub**: [Wang-Teng-Fei](https://github.com/WangTengFei)



