# CNAD-Assignment4

## 🐳 建立 Docker Image

本專案的根目錄下包含一個簡單的 Dockerfile，可建立 Python HTTP Server：

```Dockerfile
FROM python:3.10-slim
WORKDIR /app
COPY . .
EXPOSE 8080
CMD ["python", "-m", "http.server", "8080"]
```

## 📥 Clone the repository

請先將此專案 clone 至本地端以進行開發與測試：

```bash
git clone https://github.com/youchen0620/CNAD-Assignment4.git
cd CNAD-Assignment4
```

## 🔧 建構指令

```bash
docker build -t <your-docker-id>/2025cloud:latest .
```

## ▶️ 執行 Container

✅ 從本地 image 執行：

```bash
docker run -p 8080:8080 <your-docker-id>/2025cloud:latest
```

🌐 從 [Docker Hub](https://hub.docker.com/r/youchen0620/2025cloud/tags) 拉取 image：

```bash
docker pull youchen0620/2025cloud:<selected-tag>
docker run -p 8080:8080 youchen0620/2025cloud:<selected-tag>
```

## ⚙️ GitHub Actions 自動化流程

Push 或提 PR 時，GitHub Actions 將：
- 自動執行建構
- 自動推送到 Docker Hub
- 使用自動生成的唯一 Tag

CI 檔案位於 `.github/workflows/build.yml`。

☑️ 自動化條件：
- 建構成功
- Docker 登入憑證正確設定
- Image tag 不重複

## 🏷️ Image Tag 設計

為避免 image/tag 重複覆蓋，使用以下命名規則：

```text
<commit_hash>-<YYYYMMDD-HHMM>
e.g. b7e3a1f-20250505-1630
```

🟢 優點：
- 每次都產生不同 Tag
- 可追蹤來源與部署時間
