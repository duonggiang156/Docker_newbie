# fastapi

## Bước 1: Cài Đặt Docker
*Trước tiên, bạn cần cài đặt Docker trên máy của mình. Bạn có thể tải và cài đặt Docker từ trang chủ Docker.*

## Bước 2: Tạo Ứng Dụng FastAPI
*Tạo một thư mục mới cho dự án của bạn và trong thư mục đó, tạo file app.py với nội dung sau:*

```bash
from fastapi import FastAPI

app = FastAPI()

@app.get('/')
def hello():
    return "Hello, Docker!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000) 
```

## Bước 3: Tạo File requirements.txt
*Trong thư mục dự án, tạo file requirements.txt để liệt kê các thư viện cần thiết:*

```bash
fastapi==0.111.0
uvicorn[standard]==0.24.0
```
 
## Bước 4: Tạo File Dockerfile
*Tạo một file có tên Dockerfile trong thư mục dự án với nội dung sau:*

```bash
# Sử dụng hình ảnh chính thức của Python
## Sử dụng slim image giúp làm nhẹ app python của bạn, deploy nhanh hơn
FROM python:3.11.9-slim

# Đặt thư mục làm việc bên trong container
# Từ đây mặc định mọi thao tác sẽ là thao tác trong thư mục này
WORKDIR /app

# Copy các file cần thiết vào container
COPY requirements.txt requirements.txt
COPY app.py app.py

# Cài đặt các thư viện cần thiết
RUN pip install -r requirements.txt

# Mở cổng 8000
EXPOSE 8000

# Chạy ứng dụng
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
```
     

## Bước 5: Xây Dựng và Chạy Container
*Mở terminal và điều hướng đến thư mục dự án của bạn. Chạy các lệnh sau để xây dựng và chạy container:*

```bash
# Xây dựng hình ảnh Docker từ Dockerfile
docker build -t fastapi-app .

# Chạy container từ hình ảnh vừa tạo
docker run -d -p 8000:8000 fastapi-app
```


## Bước 6: Truy Cập Ứng Dụng
*Mở trình duyệt và truy cập http://localhost:8000 . Bạn sẽ thấy thông điệp "Hello, Docker!" hiển thị.*