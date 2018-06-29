##instalar el pack de imagenes necesarias
##usar el tema por default en el grub
##Splash2
sudo apt-get install grub2-splashimages
###verificar que la simagenes si se pusieron
ls /usr/share/images/grub/
##Desde interfaz gráfica svisualizar
################################################3
##Archivo principal del grub
sudo nano -v /etc/default/grub
###########################################################33
##GRUB_DEFAULT= 0: Con la opción 0 hacemos que se seleccione por defecto la primera entrada al sistema
##GRUB_HIDDEN_TIMEOUT=0: De default está linea esta comentada y su función es esconder la entrada al menú.
##GRUB_HIDDEN_MENU_QUIET=true/false: Su función es esconder o mostrar la Cuenta regresiva
##GRUB_TIMEOUT=Tiempo : Su función es Esperar el tiempo enecesario hasta arrancar la opción marcada
#GRUB_GFXMODE=640×480: Resolución de Pantalla
###GRUB_DISABLE_LINUX_RECOVERY=”true”: Si la descomentas no aparecerá la opción de Recuperación de sistema
##GRUB_BACKGROUND = “Ruta del archivo”, Imagen que se pone de fondo
sudo nano /etc/grub.d/05_debian_theme
###Ubicar la línea donde dice "color_normal" y "color_highlight"
###Color_normal = Es para cambiar los colores de las letras y el fondo
##color_highlight = Es para cambiar el resaltado de las teclas
black
blue
green
cyan
red
magenta
brown
light-gray
These below can be specified only for the foreground.

dark-gray
light-blue
light-green
light-cyan
light-red
light-magenta
yellow
white
##https://www.gnu.org/software/grub/manual/legacy/color.html
###Herramienta por si las moscas
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install boot-repair
boot-repair
###
sudo update-grub