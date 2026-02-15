clear
echo "════════════════════════════════════════"
echo "  🚀 INSTALADOR DE RICK PRO V3.0"
echo "════════════════════════════════════════"
echo ""

echo "📦 Actualizando paquetes..."
pkg update -y 2>&1 | grep -v "dpkg"
pkg upgrade -y 2>&1 | grep -v "dpkg"

echo ""
echo "⚙️  Instalando Python, FFmpeg y Git..."
pkg install python ffmpeg git -y 2>&1 | grep -v "dpkg"

echo ""
echo "🐍 Instalando librerías Python..."
pip install flask flask-cors yt-dlp --break-system-packages 2>&1 | grep -v "Requirement already satisfied"

echo ""
echo "📱 Solicitando permisos de almacenamiento..."
echo "   ⚠️  ACEPTA EL PERMISO CUANDO APAREZCA"
sleep 2
termux-setup-storage
sleep 3

echo ""
echo "📥 Descargando RICK PRO..."
cd ~
rm -rf Rick-v01 2>/dev/null
git clone https://github.com/Ricardoalcedo/Rick-v01.git 2>&1 | grep -v "Cloning"
cd Rick-v01

echo ""
echo "📁 Creando estructura de carpetas..."
mkdir -p /storage/emulated/0/DCIM/Rick 2>/dev/null
mkdir -p /storage/emulated/0/DCIM/Rick/.thumbnails 2>/dev/null

echo ""
echo "🔧 Creando script de inicio..."
cat > ~/start-rick.sh << 'ENDSTART'
#!/data/data/com.termux/files/usr/bin/bash
clear
echo "════════════════════════════════════════"
echo "  ⚡ INICIANDO RICK PRO V3.0"
echo "════════════════════════════════════════"
echo ""
cd ~/Rick-v01
echo "🔥 Iniciando backend..."
python3 "Backend v.01" &
sleep 3
echo "🌐 Iniciando servidor web..."
python3 -m http.server 8080 &
sleep 2
echo ""
echo "✅ RICK PRO iniciado correctamente"
echo ""
echo "📱 Abriendo navegador..."
termux-open-url http://localhost:8080
echo ""
echo "🌐 URL: http://localhost:8080"
echo ""
echo "Para detener: pkill -f python3"
echo "════════════════════════════════════════"
ENDSTART

chmod +x ~/start-rick.sh

echo ""
echo "🎨 Creando alias..."
echo 'alias rick="bash ~/start-rick.sh"' >> ~/.bashrc

clear
echo ""
echo "════════════════════════════════════════"
echo "  ✅ INSTALACIÓN COMPLETADA"
echo "════════════════════════════════════════"
echo ""
echo "🚀 Para iniciar RICK PRO escribe:"
echo ""
echo "   rick"
echo ""
echo "   o"
echo ""
echo "   bash ~/start-rick.sh"
echo ""
echo "════════════════════════════════════════"
echo ""
echo "📌 Reinicia Termux para que funcione el alias 'rick'"
echo ""
