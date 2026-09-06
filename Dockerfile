FROM python:3.10-slim

# تثبيت الاعتماديات الأساسية
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# تثبيت Playwright
RUN pip install playwright && \
    playwright install chromium && \
    playwright install-deps chromium

# إنشاء مجلد العمل
WORKDIR /app

# نسخ ملف المتطلبات أولاً للتخزين المؤقت
COPY requirements.txt .

# تثبيت المتطلبات
RUN pip install --no-cache-dir -r requirements.txt

# نسخ باقي الملفات
COPY . .

# تشغيل السكريبت
CMD ["sh", "-c", "if [ -d \"A-replit26\" ]; then cd A-replit26 && git pull; else git clone https://github.com/fededd22/A-replit26.git && cd A-replit26; fi && pip install -r requirements.txt && python Keep_alive.py"]
