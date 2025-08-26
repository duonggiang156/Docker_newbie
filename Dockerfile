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