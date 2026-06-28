FROM python:3.12-slim

# uv をインストール
RUN pip install --no-cache-dir uv

# 作業ディレクトリ
WORKDIR /app

# ソースコードをコピー
COPY . /app

# 依存関係をインストール
RUN uv sync

# vault のマウントポイント（コンテナ内）
VOLUME /vault

# ポート 8420 を公開
EXPOSE 8420

# デフォルトの環境変数
ENV VAULT_PATH=/vault \
    VAULT_MCP_HOST=0.0.0.0 \
    VAULT_MCP_PORT=8420

# 起動コマンド
CMD ["uv", "run", "vault-mcp"]
