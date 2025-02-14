FROM python:3.12-slim

WORKDIR /app

COPY . .

# Install uv and use it to install dependencies
RUN pip install uv && \
    uv pip install -e . && \
    uv pip install --dev

# Set environment variables
ENV LOG_LEVEL=DEBUG \
    LOG_FILE_PATH=/tmp/omero_screen.log \
    HOST=omeroserver \
    USERNAME=root \
    PASSWORD=omero

CMD ["uv", "run", "pytest", "tests/", "-v", "--ignore=tests/e2e"]
