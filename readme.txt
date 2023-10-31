como instalar en windows el huellero 

- 1 instalar WSL en windows en mi caso use "https://www.microsoft.com/store/productid/9PDXGNCFSCZV?ocid=pdpshare" y ejecutar  e instalar con doble click el archivo "usbipd-win_3.2.0"

- 2 copiar la carpeta  "instalacion-sdk-digitalpersona" en ubuntu
    Nota :  si vas a este equipo podras ver el icono de linux y podras entrar y copiar los archivos donde prefieras , si necesitas permisos se los puedes dar con "sudo chmod -R 777 nombreCarpeta"

- 3 crea una nueva carpeta en "C:\finger" y asegurate que el archivo "finger.ps1" este ahi

 
- 4  entrar a la terminal de ubuntu y ejecuta "sudo apt install linux-tools-generic hwdata" y luego "sudo update-alternatives --install /usr/local/bin/usbip usbip /usr/lib/linux-tools/*-generic/usbip 20".  entra a la carpeta "instalacion-sdk-digitalpersona" ejecutar " bash sdk.sh "
    Nota : esto instalara el sdk en wsl ,     basado en https://learn.microsoft.com/es-es/windows/wsl/connect-usb

- 5 luego  en windows  "windows + R" y copiar "taskschd.msc" , crea una tarea basica y en el apartado de "acciones" crea uno nuevo selecciona la accion "Iniciar un programa", luego pega en progrmas y script "PowerShell.exe" y en "agregar argumentos" agrega  "cd C:\Users\jgnie\Documents\scrips (aqui la ruta en la que se encuentra el archivo "RunHidden.vbs")  ; .\RunHidden.vbs"    en el apartado de general marca la opcion de "ejecutar con privilegios altos" luego en "desencadenadores" que inicie la tarea al iniciar sesion 

 
