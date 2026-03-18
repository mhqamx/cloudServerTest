# cloudServerTest

一个基于 Vue 3 + Vite 的前端项目。

## 本地开发

安装依赖：

```bash
npm install
```

启动开发服务器：

```bash
npm run dev
```

## GitHub Codespaces

Codespaces 拉下代码后不会自带 `node_modules`，需要先安装依赖。

推荐步骤：

```bash
npm run setup
npm run dev -- --host 0.0.0.0
```

如果不使用 `setup` 脚本，也可以直接：

```bash
npm install
npm run dev -- --host 0.0.0.0
```

## 可用命令

```bash
npm run setup
npm run dev
npm run build
npm run preview
```
