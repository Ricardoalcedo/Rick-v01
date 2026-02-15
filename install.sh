#!/data/data/com.termux/files/usr/bin/bash
clear
echo "🚀 INSTALANDO RICK PRO V3.0..."
echo ""
pkg update -y && pkg upgrade -y
pkg install python ffmpeg git -y
pip install flask flask-cors yt-dlp --break-system-packages
echo "📱 ACEPTA EL PERMISO"
termux-setup-storage
sleep 3
cd ~
rm -rf Rick-v01
git clone https://github.com/Ricardoalcedo/Rick-v01.git
cd Rick-v01
mkdir -p /storage/emulated/0/DCIM/Rick
mkdir -p /storage/emulated/0/DCIM/Rick/.thumbnails
cat > ~/start-rick.sh << 'END'
#!/bin/bash
clear
echo "⚡ INICIANDO RICK PRO..."
cd ~/Rick-v01
python3 "Backend v.01" &
sleep 3
python3 -m http.server 8080 &
sleep 2
termux-open-url http://localhost:8080
echo "✅ Abierto en Chrome"
END
chmod +x ~/start-rick.sh
echo 'alias rick="bash ~/start-rick.sh"' >> ~/.bashrc
clear
echo "✅ INSTALACIÓN COMPLETA"
echo ""
echo "Escribe: rick"
