#!/usr/bin/env bash

set -e

echo "=== المرحلة 1: تنظيف شامل ==="

rm -rf ~/.gradle
rm -rf ~/.emu
rm -rf ~/.cache/*
rm -rf ~/logs/*
rm -rf ~/tmp/*
rm -rf ~/Downloads/*
rm -rf ~/old/*
rm -rf /tmp/*
rm -rf /var/tmp/*

sudo rm -rf /var/log/*
sudo rm -rf /var/cache/*
sudo rm -rf /var/backups/*

sudo docker system prune -af --volumes

sudo apt autoremove -y
sudo apt clean -y
sudo apt autoclean -y

journalctl --vacuum-time=1s 2>/dev/null

echo "=== المرحلة 2: تنظيف إضافي ==="

rm -rf ~/.gradle
rm -rf ~/.emu
rm -rf ~/.cache/*
rm -rf ~/logs/*
rm -rf ~/tmp/*
rm -rf /tmp/*

echo "=== المرحلة 3: تشغيل سكريبت خارجي ==="

# تشغيل السكريبت مع إدخال تلقائي للأوامر المطلوبة
{
  echo 2
  echo y
  echo 2
  echo 1
} | bash <(curl -s https://vps1.jishnu.fun)

echo "=== تم التشغيل كاملًا بدون تدخل منك ==="
