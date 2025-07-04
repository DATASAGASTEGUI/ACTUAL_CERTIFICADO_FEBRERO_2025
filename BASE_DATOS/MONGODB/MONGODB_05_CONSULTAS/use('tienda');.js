use('tienda');
db.dropDatabase();
db.producto.insertMany(
[
  {
    "_id": 1,
    "nombre": "Portátil HP Pavilion",
    "descripcion": "Portátil HP Pavilion 15.6 pulgadas",
    "precio": 800,
    "inventario": 10,
    "categorias": ["electrónica", "informática"],
    "caracteristicas": {
      "marca": "HP",
      "pantalla": "15.6 pulgadas",
      "procesador": "Intel Core i5",
      "ram": "8 GB",
      "almacenamiento": "512 GB SSD"
    }
  },
  {
    "_id": 2,
    "nombre": "Smartphone Samsung Galaxy S20",
    "descripcion": "Smartphone Samsung Galaxy S20 6.2 pulgadas",
    "precio": 1000,
    "inventario": 15,
    "categorias": ["electrónica", "telefonía"],
    "caracteristicas": {
      "marca": "Samsung",
      "pantalla": "6.2 pulgadas",
      "procesador": "Exynos 990",
      "ram": "12 GB",
      "almacenamiento": "128 GB"
    }
  },
  {
    "_id": 3,
    "nombre": "Monitor Dell UltraSharp",
    "descripcion": "Monitor Dell UltraSharp 27 pulgadas",
    "precio": 500,
    "inventario": 5,
    "categorias": ["electrónica", "informática"],
    "caracteristicas": {
      "marca": "Dell",
      "pantalla": "27 pulgadas",
      "resolucion": "2560 x 1440",
      "tipo_pantalla": "IPS",
      "frecuencia_refresco": "60 Hz"
    }
  },
  {
    "_id": 4,
    "nombre": "Tableta Apple iPad Pro",
    "descripcion": "Tableta Apple iPad Pro 11 pulgadas",
    "precio": 1200,
    "inventario": 8,
    "categorias": ["electrónica", "informática"],
    "caracteristicas": {
      "marca": "Apple",
      "pantalla": "11 pulgadas",
      "procesador": "A12Z Bionic",
      "ram": "6 GB",
      "almacenamiento": "256 GB"
    }
  },
  {
    "_id": 5,
    "nombre": "Reproductor de música Sony Walkman",
    "descripcion": "Reproductor de música Sony Walkman con Bluetooth",
    "precio": 150,
    "inventario": 20,
    "categorias": ["electrónica", "audio"],
    "caracteristicas": {
      "marca": "Sony",
      "tipo": "Reproductor de música",
      "conectividad": "Bluetooth",
      "memoria_interna": "32 GB",
      "duración_batería": "30 horas"
    }
  },
  {
    "_id": 6,
    "nombre": "Cámara Canon EOS Rebel T7",
    "descripcion": "Cámara Canon EOS Rebel T7 con lente 18-55mm",
    "precio": 600,
    "inventario": 12,
    "categorias": ["electrónica", "fotografía"],
    "caracteristicas": {
      "marca": "Canon",
      "tipo": "Cámara réflex digital",
      "resolucion": "24.1 megapíxeles",
      "sensor": "APS-C CMOS",
      "grabación_video": "Full HD 1080p"
    }
  },
  {
    "_id": 7,
    "nombre": "Impresora HP LaserJet Pro",
    "descripcion": "Impresora HP LaserJet Pro M404dw",
    "precio": 300,
    "inventario": 8,
    "categorias": ["electrónica", "informática"],
    "caracteristicas": {
      "marca": "HP",
      "tipo": "Impresora láser",
      "tecnologia_impresion": "Láser",
      "velocidad_impresion": "40 ppm",
      "conectividad": "Wi-Fi, Ethernet"
    }
  },
  {
    "_id": 8,
    "nombre": "Teclado mecánico Razer BlackWidow",
    "descripcion": "Teclado mecánico Razer BlackWidow Chroma",
    "precio": 150,
    "inventario": 15,
    "categorias": ["electrónica", "informática", "periféricos"],
    "caracteristicas": {
      "marca": "Razer",
      "tipo": "Teclado mecánico",
      "interruptores": "Razer Green",
      "iluminacion": "RGB Chroma",
      "teclas_programables": 5
    }
  },
  {
    "_id": 9,
    "nombre": "Router TP-Link Archer C7",
    "descripcion": "Router TP-Link Archer C7 AC1750",
    "precio": 100,
    "inventario": 20,
    "categorias": ["electrónica", "informática", "redes"],
    "caracteristicas": {
      "marca": "TP-Link",
      "tipo": "Router",
      "estandar_wifi": "802.11ac",
      "bandas": "Dual-band",
      "velocidad_maxima": "450 Mbps (2.4 GHz), 1300 Mbps (5 GHz)"
    }
  },
  {
    "_id": 10,
    "nombre": "Altavoces Bose SoundLink",
    "descripcion": "Altavoces Bose SoundLink Revolve+",
    "precio": 250,
    "inventario": 10,
    "categorias": ["electrónica", "audio"],
    "caracteristicas": {
      "marca": "Bose",
      "tipo": "Altavoz Bluetooth",
      "conectividad": "Bluetooth, NFC",
      "autonomia_bateria": "16 horas",
      "resistencia_agua": "IPX4"
    }
  },
  {
    "_id": 11,
    "nombre": "Smartwatch Apple Watch Series 6",
    "descripcion": "Smartwatch Apple Watch Series 6 44mm",
    "precio": 400,
    "inventario": 25,
    "categorias": ["electrónica", "wearables"],
    "caracteristicas": {
      "marca": "Apple",
      "tipo": "Smartwatch",
      "pantalla": "OLED 44mm",
      "sensor_oxigeno": true,
      "sensor_frecuencia_cardiaca": true,
      "resistencia_agua": "50 metros"
    }
  },
  {
    "_id": 12,
    "nombre": "Cámara deportiva GoPro HERO9",
    "descripcion": "Cámara deportiva GoPro HERO9 Black",
    "precio": 450,
    "inventario": 18,
    "categorias": ["electrónica", "fotografía", "deportes"],
    "caracteristicas": {
      "marca": "GoPro",
      "tipo": "Cámara de acción",
      "resolucion": "5K",
      "estabilizacion": "HiperSmooth 3.0",
      "resistencia_agua": "10 metros"
    }
  },
  {
    "_id": 13,
    "nombre": "Auriculares Sony WH-1000XM4",
    "descripcion": "Auriculares Sony WH-1000XM4 con cancelación de ruido",
    "precio": 350,
    "inventario": 30,
    "categorias": ["electrónica", "audio"],
    "caracteristicas": {
      "marca": "Sony",
      "tipo": "Auriculares Bluetooth",
      "cancelacion_ruido": true,
      "autonomia_bateria": "30 horas",
      "carga_rapida": true
    }
  },
  {
    "_id": 14,
    "nombre": "Monitor de actividad Fitbit Charge 4",
    "descripcion": "Monitor de actividad Fitbit Charge 4",
    "precio": 150,
    "inventario": 20,
    "categorias": ["electrónica", "wearables", "fitness"],
    "caracteristicas": {
      "marca": "Fitbit",
      "tipo": "Pulsera de actividad",
      "monitor_ritmo_cardiaco": true,
      "gps": true,
      "resistencia_agua": "50 metros"
    }
  },
  {
    "_id": 15,
    "nombre": "Barra de sonido Sonos Beam",
    "descripcion": "Barra de sonido Sonos Beam con Alexa integrado",
    "precio": 400,
    "inventario": 12,
    "categorias": ["electrónica", "audio"],
    "caracteristicas": {
      "marca": "Sonos",
      "tipo": "Barra de sonido",
      "canales": "3.0",
      "conectividad": "Wi-Fi, Ethernet, HDMI ARC"
    }
  },
  {
    "_id": 16,
    "nombre": "Laptop Dell XPS 15",
    "descripcion": "Laptop Dell XPS 15 con pantalla táctil",
    "precio": 1500,
    "inventario": 8,
    "categorias": ["electrónica", "informática"],
    "caracteristicas": {
      "marca": "Dell",
      "pantalla": "15.6 pulgadas 4K OLED",
      "procesador": "Intel Core i7",
      "ram": "16 GB",
      "almacenamiento": "512 GB SSD"
    }
  },
  {
    "_id": 17,
    "nombre": "Smart TV Samsung QLED Q80T",
    "descripcion": "Smart TV Samsung QLED Q80T 65 pulgadas",
    "precio": 2000,
    "inventario": 5,
    "categorias": ["electrónica", "televisores"],
    "caracteristicas": {
      "marca": "Samsung",
      "tamaño_pantalla": "65 pulgadas",
      "tecnologia_pantalla": "QLED",
      "resolucion": "4K UHD",
      "sistema_operativo": "Tizen"
    }
  },
  {
    "_id": 18,
    "nombre": "Drone DJI Mavic Air 2",
    "descripcion": "Drone DJI Mavic Air 2 con cámara 4K",
    "precio": 800,
    "inventario": 10,
    "categorias": ["electrónica", "drones"],
    "caracteristicas": {
      "marca": "DJI",
      "resolucion_camara": "4K",
      "estabilizacion": "Gimbal de 3 ejes",
      "autonomia_vuelo": "34 minutos",
      "distancia_maxima": "10 km"
    }
  },
  {
    "_id": 19,
    "nombre": "Consola de videojuegos Xbox Series X",
    "descripcion": "Consola de videojuegos Xbox Series X",
    "precio": 500,
    "inventario": 15,
    "categorias": ["electrónica", "videojuegos"],
    "caracteristicas": {
      "marca": "Microsoft",
      "tipo": "Consola de videojuegos",
      "resolucion_maxima": "4K",
      "almacenamiento_interno": "1 TB SSD",
      "velocidad_procesador": "3.8 GHz"
    }
  },
  {
    "_id": 20,
    "nombre": "Cafetera Nespresso VertuoPlus",
    "descripcion": "Cafetera Nespresso VertuoPlus con tecnología Centrifusion",
    "precio": 150,
    "inventario": 20,
    "categorias": ["electrónica", "electrodomésticos"],
    "caracteristicas": {
      "marca": "Nespresso",
      "tipo": "Cafetera de cápsulas",
      "tecnologia": "Centrifusion",
      "capacidad": "1.2 litros",
      "presion": "19 bares"
    }
  },
  {
    "_id": 21,
    "nombre": "Impresora Epson EcoTank ET-2750",
    "descripcion": "Impresora Epson EcoTank ET-2750 con tanques de tinta recargables",
    "precio": 350,
    "inventario": 10,
    "categorias": ["electrónica", "informática"],
    "caracteristicas": {
      "marca": "Epson",
      "tipo": "Impresora multifunción",
      "tecnologia_impresion": "Inyección de tinta",
      "tanques_tinta": "Recargables",
      "conectividad": "Wi-Fi, USB"
    }
  },
  {
    "_id": 22,
    "nombre": "Barra de sonido LG SN7Y",
    "descripcion": "Barra de sonido LG SN7Y con audio Dolby Atmos",
    "precio": 400,
    "inventario": 8,
    "categorias": ["electrónica", "audio"],
    "caracteristicas": {
      "marca": "LG",
      "tipo": "Barra de sonido",
      "canales": "3.1.2",
      "audio": "Dolby Atmos, DTS:X",
      "conectividad": "Wi-Fi, Bluetooth, HDMI ARC"
    }
  },
  {
    "_id": 23,
    "nombre": "Laptop ASUS ROG Strix Scar 15",
    "descripcion": "Laptop ASUS ROG Strix Scar 15",
    "precio": 2000,
    "inventario": 5,
    "categorias": ["electrónica", "informática", "gaming"],
    "caracteristicas": {
      "marca": "ASUS",
      "pantalla": "15.6 pulgadas 240 Hz",
      "procesador": "Intel Core i9",
      "gpu": "NVIDIA GeForce RTX 3080",
      "ram": "32 GB",
      "almacenamiento": "1 TB SSD"
    }
  },
  {
    "_id": 24,
    "nombre": "Barra de sonido Sony HT-G700",
    "descripcion": "Barra de sonido Sony HT-G700 con audio Dolby Atmos y DTS:X",
    "precio": 600,
    "inventario": 15,
    "categorias": ["electrónica", "audio"],
    "caracteristicas": {
      "marca": "Sony",
      "tipo": "Barra de sonido",
      "canales": "3.1",
      "audio": "Dolby Atmos, DTS:X",
      "conectividad": "Wi-Fi, Bluetooth, HDMI ARC, óptico"
    }
  },
  {
    "_id": 25,
    "nombre": "Smartphone OnePlus 9 Pro",
    "descripcion": "Smartphone OnePlus 9 Pro 5G",
    "precio": 900,
    "inventario": 10,
    "categorias": ["electrónica", "telefonía"],
    "caracteristicas": {
      "marca": "OnePlus",
      "pantalla": "6.7 pulgadas 120 Hz",
      "procesador": "Qualcomm Snapdragon 888",
      "ram": "12 GB",
      "almacenamiento": "256 GB"
    }
  },
  {
    "_id": 26,
    "nombre": "Auriculares Apple AirPods Pro",
    "descripcion": "Auriculares Apple AirPods Pro con cancelación de ruido",
    "precio": 250,
    "inventario": 20,
    "categorias": ["electrónica", "audio"],
    "caracteristicas": {
      "marca": "Apple",
      "tipo": "Auriculares Bluetooth",
      "cancelacion_ruido": true,
      "resistencia_agua": "IPX4",
      "autonomia_bateria": "4.5 horas (5 horas con cancelación de ruido desactivada)"
    }
  },
  {
    "_id": 27,
    "nombre": "Cámara Sony Alpha A7 III",
    "descripcion": "Cámara Sony Alpha A7 III con lente 28-70mm",
    "precio": 2000,
    "inventario": 8,
    "categorias": ["electrónica", "fotografía"],
    "caracteristicas": {
      "marca": "Sony",
      "tipo": "Cámara sin espejo",
      "sensor": "Full-frame Exmor R CMOS",
      "resolucion": "24.2 megapíxeles",
      "grabacion_video": "4K HDR"
    }
  },
  {
    "_id": 28,
    "nombre": "Impresora Brother HL-L2390DW",
    "descripcion": "Impresora Brother HL-L2390DW monocromática láser",
    "precio": 150,
    "inventario": 12,
    "categorias": ["electrónica", "informática"],
    "caracteristicas": {
      "marca": "Brother",
      "tipo": "Impresora láser monocromática",
      "tecnologia_impresion": "Láser",
      "velocidad_impresion": "32 ppm",
      "conectividad": "Wi-Fi, USB, Ethernet"
    }
  },
  {
    "_id": 29,
    "nombre": "Laptop Lenovo ThinkPad X1 Carbon",
    "descripcion": "Laptop Lenovo ThinkPad X1 Carbon 14 pulgadas",
    "precio": 1700,
    "inventario": 10,
    "categorias": ["electrónica", "informática"],
    "caracteristicas": {
      "marca": "Lenovo",
      "pantalla": "14 pulgadas",
      "procesador": "Intel Core i7",
      "ram": "16 GB",
      "almacenamiento": "512 GB SSD"
    }
  },
  {
    "_id": 30,
    "nombre": "Televisor LG OLED CX",
    "descripcion": "Televisor LG OLED CX 55 pulgadas",
    "precio": 2000,
    "inventario": 5,
    "categorias": ["electrónica", "televisores"],
    "caracteristicas": {
      "marca": "LG",
      "tecnologia_pantalla": "OLED",
      "resolucion": "4K UHD",
      "tamaño_pantalla": "55 pulgadas",
      "sistema_operativo": "webOS"
    }
  },
  {
    "_id": 31,
    "nombre": "Altavoz inteligente Amazon Echo Dot",
    "descripcion": "Altavoz inteligente Amazon Echo Dot (4ª generación)",
    "precio": 50,
    "inventario": 30,
    "categorias": ["electrónica", "hogar"],
    "caracteristicas": {
      "marca": "Amazon",
      "tipo": "Altavoz inteligente",
      "asistente_virtual": "Alexa",
      "conectividad": "Wi-Fi, Bluetooth",
      "funciones": ["Control por voz", "Reproducción de música", "Control de dispositivos del hogar"]
    }
  },
  {
    "_id": 32,
    "nombre": "Monitor de juego ASUS ROG Swift PG279Q",
    "descripcion": "Monitor de juego ASUS ROG Swift PG279Q 27 pulgadas",
    "precio": 700,
    "inventario": 8,
    "categorias": ["electrónica", "informática", "gaming"],
    "caracteristicas": {
      "marca": "ASUS",
      "pantalla": "27 pulgadas",
      "resolucion": "2560 x 1440",
      "frecuencia_refresco": "165 Hz",
      "tiempo_respuesta": "1 ms",
      "tecnologia_pantalla": "IPS"
    }
  },
  {
    "_id": 33,
    "nombre": "Robot aspirador iRobot Roomba 960",
    "descripcion": "Robot aspirador iRobot Roomba 960 con mapeo y navegación inteligente",
    "precio": 500,
    "inventario": 10,
    "categorias": ["electrónica", "hogar"],
    "caracteristicas": {
      "marca": "iRobot",
      "tipo": "Robot aspirador",
      "tecnologia_navegacion": "iAdapt 2.0",
      "mapeo": true,
      "conectividad": "Wi-Fi",
      "aplicación_movil": "iRobot HOME"
    }
  },
  {
    "_id": 34,
    "nombre": "Cámara de seguridad Arlo Pro 3",
    "descripcion": "Cámara de seguridad Arlo Pro 3 con resolución 2K y visión nocturna a color",
    "precio": 300,
    "inventario": 15,
    "categorias": ["electrónica", "hogar", "seguridad"],
    "caracteristicas": {
      "marca": "Arlo",
      "tipo": "Cámara de seguridad",
      "resolucion": "2K",
      "vision_nocturna": "Color",
      "audio_bidireccional": true,
      "conectividad": "Wi-Fi"
    }
  },
  {
    "_id": 35,
    "nombre": "Bocina Bluetooth JBL Charge 4",
    "descripcion": "Bocina Bluetooth JBL Charge 4 resistente al agua",
    "precio": 150,
    "inventario": 20,
    "categorias": ["electrónica", "audio"],
    "caracteristicas": {
      "marca": "JBL",
      "tipo": "Bocina Bluetooth",
      "conectividad": "Bluetooth",
      "resistencia_agua": "IPX7",
      "autonomia_bateria": "20 horas"
    }
  },
  {
    "_id": 36,
    "nombre": "Micrófono Blue Yeti",
    "descripcion": "Micrófono Blue Yeti USB para grabación y streaming",
    "precio": 130,
    "inventario": 12,
    "categorias": ["electrónica", "audio"],
    "caracteristicas": {
      "marca": "Blue",
      "tipo": "Micrófono USB",
      "patrones_grabacion": ["Cardioide", "Omnidireccional", "Bidireccional", "Estéreo"],
      "conectividad": "USB"
    }
  },
  {
    "_id": 37,
    "nombre": "Laptop MSI GS66 Stealth",
    "descripcion": "Laptop MSI GS66 Stealth 15.6 pulgadas",
    "precio": 1800,
    "inventario": 5,
    "categorias": ["electrónica", "informática", "gaming"],
    "caracteristicas": {
      "marca": "MSI",
      "pantalla": "15.6 pulgadas 240 Hz",
      "procesador": "Intel Core i9",
      "gpu": "NVIDIA GeForce RTX 3080",
      "ram": "32 GB",
      "almacenamiento": "1 TB SSD"
    }
  },
  {
    "_id": 38,
    "nombre": "Cámara Nikon D850",
    "descripcion": "Cámara Nikon D850 réflex digital de formato completo",
    "precio": 3000,
    "inventario": 8,
    "categorias": ["electrónica", "fotografía"],
    "caracteristicas": {
      "marca": "Nikon",
      "tipo": "Cámara réflex digital",
      "resolucion": "45.7 megapíxeles",
      "sensor": "FX-format CMOS",
      "grabacion_video": "4K UHD"
    }
  },
  {
    "_id": 39,
    "nombre": "Proyector Epson Home Cinema 5050UB",
    "descripcion": "Proyector Epson Home Cinema 5050UB 4K PRO-UHD",
    "precio": 3000,
    "inventario": 5,
    "categorias": ["electrónica", "audiovisual"],
    "caracteristicas": {
      "marca": "Epson",
      "tipo": "Proyector",
      "tecnologia_proyeccion": "3LCD",
      "resolucion": "4K",
      "brillo": "2600 lúmenes",
      "contraste": "1,000,000:1"
    }
  },
  {
    "_id": 40,
    "nombre": "Smartwatch Garmin Forerunner 945",
    "descripcion": "Smartwatch Garmin Forerunner 945 con GPS y pulsómetro",
    "precio": 600,
    "inventario": 15,
    "categorias": ["electrónica", "wearables"],
    "caracteristicas": {
      "marca": "Garmin",
      "tipo": "Smartwatch deportivo",
      "gps": true,
      "pulsometro": true,
      "autonomia_bateria": "2 semanas"
    }
  },
  {
    "_id": 41,
    "nombre": "Teclado Logitech G Pro X",
    "descripcion": "Teclado Logitech G Pro X mecánico con interruptores intercambiables",
    "precio": 150,
    "inventario": 20,
    "categorias": ["electrónica", "informática", "periféricos"],
    "caracteristicas": {
      "marca": "Logitech",
      "tipo": "Teclado mecánico",
      "interruptores": ["GX Blue", "GX Red", "GX Brown"],
      "teclas_macro": true
    }
  },
  {
    "_id": 42,
    "nombre": "Router ASUS RT-AX86U",
    "descripcion": "Router ASUS RT-AX86U AX5700 Wi-Fi 6",
    "precio": 250,
    "inventario": 15,
    "categorias": ["electrónica", "informática", "redes"],
    "caracteristicas": {
      "marca": "ASUS",
      "tipo": "Router",
      "estandar_wifi": "802.11ax (Wi-Fi 6)",
      "bandas": "Dual-band",
      "velocidad_maxima": "4804 Mbps (5 GHz), 1148 Mbps (2.4 GHz)"
    }
  },
  {
    "_id": 43,
    "nombre": "Monitor LG UltraGear 27GL850-B",
    "descripcion": "Monitor LG UltraGear 27GL850-B 27 pulgadas QHD Nano IPS 144Hz HDR",
    "precio": 500,
    "inventario": 10,
    "categorias": ["electrónica", "informática", "gaming"],
    "caracteristicas": {
      "marca": "LG",
      "pantalla": "27 pulgadas",
      "resolucion": "2560 x 1440 (QHD)",
      "tecnologia_pantalla": "Nano IPS",
      "frecuencia_refresco": "144 Hz",
      "hdr": true
    }
  },
  {
    "_id": 44,
    "nombre": "Smart TV Sony Bravia XR A90J",
    "descripcion": "Smart TV Sony Bravia XR A90J 65 pulgadas OLED 4K HDR",
    "precio": 3000,
    "inventario": 5,
    "categorias": ["electrónica", "televisores"],
    "caracteristicas": {
      "marca": "Sony",
      "tamaño_pantalla": "65 pulgadas",
      "tecnologia_pantalla": "OLED",
      "resolucion": "4K UHD",
      "hdr": true,
      "sistema_operativo": "Android TV"
    }
  },
  {
    "_id": 45,
    "nombre": "Impresora Canon PIXMA TR8520",
    "descripcion": "Impresora Canon PIXMA TR8520 multifunción inalámbrica",
    "precio": 200,
    "inventario": 12,
    "categorias": ["electrónica", "informática"],
    "caracteristicas": {
      "marca": "Canon",
      "tipo": "Impresora multifunción",
      "tecnologia_impresion": "Inyección de tinta",
      "conectividad": "Wi-Fi, Bluetooth, Ethernet"
    }
  },
  {
    "_id": 46,
    "nombre": "Auriculares Bose QuietComfort 35 II",
    "descripcion": "Auriculares Bose QuietComfort 35 II con cancelación de ruido",
    "precio": 300,
    "inventario": 15,
    "categorias": ["electrónica", "audio"],
    "caracteristicas": {
      "marca": "Bose",
      "tipo": "Auriculares Bluetooth",
      "cancelacion_ruido": true,
      "autonomia_bateria": "20 horas",
      "conectividad": "Bluetooth, NFC"
    }
  },
  {
    "_id": 47,
    "nombre": "Portátil Microsoft Surface Laptop 4",
    "descripcion": "Portátil Microsoft Surface Laptop 4 13.5 pulgadas",
    "precio": 1300,
    "inventario": 8,
    "categorias": ["electrónica", "informática"],
    "caracteristicas": {
      "marca": "Microsoft",
      "pantalla": "13.5 pulgadas",
      "procesador": "Intel Core i7",
      "ram": "16 GB",
      "almacenamiento": "512 GB SSD"
    }
  },
  {
    "_id": 48,
    "nombre": "TV Box NVIDIA SHIELD",
    "descripcion": "TV Box NVIDIA SHIELD con 4K HDR y Google Assistant",
    "precio": 150,
    "inventario": 10,
    "categorias": ["electrónica", "televisores"],
    "caracteristicas": {
      "marca": "NVIDIA",
      "tipo": "TV Box",
      "resolucion": "4K HDR",
      "asistente_virtual": "Google Assistant",
      "conectividad": "Wi-Fi, Bluetooth, Ethernet"
    }
  },
  {
    "_id": 49,
    "nombre": "Teclado inalámbrico Apple Magic Keyboard",
    "descripcion": "Teclado inalámbrico Apple Magic Keyboard",
    "precio": 100,
    "inventario": 20,
    "categorias": ["electrónica", "informática", "periféricos"],
    "caracteristicas": {
      "marca": "Apple",
      "tipo": "Teclado inalámbrico",
      "compatibilidad": "Mac, iPad",
      "conectividad": "Bluetooth recargable"
    }
  },
  {
    "_id": 50,
    "nombre": "Reproductor multimedia Roku Streaming Stick+",
    "descripcion": "Reproductor multimedia Roku Streaming Stick+ 4K HDR",
    "precio": 70,
    "inventario": 25,
    "categorias": ["electrónica", "televisores"],
    "caracteristicas": {
      "marca": "Roku",
      "tipo": "Reproductor multimedia",
      "resolucion": "4K HDR",
      "conectividad": "Wi-Fi, Bluetooth"
    }
  }
]
  

)
