m
# Cargar la biblioteca
library(leaflet)

# Crear un dataframe con los nombres y coordenadas de las universidades
universidades <- data.frame(
  nombre = c(
    "UBA Derecho", "UBA FADU", "UBA FCEN", "UBA Filo y Letras", "UBA Ingeniería", 
    "UBA Medicina", "UBA Psicología", "UBA Sociales",
    "UNA Audiovisuales", "UNA Dramáticas", "UNA Movimiento", "UNA Visuales",
    "UNC Arquitectura", "UNC Artes", "UNC Comunicación", "UNC Filosofía", "UNC Psicología",
    "UNCa", "UNCo", "UNER Trabajo Social", "UNGS Actividades culturales, clases públicas y olla popular",
    "UNJu Humanas y Sociales", "UNLaM", "UNLP Artes", "UNLP Colegio Nacional", 
    "UNLP Periodismo", "UNLP Psicología", "UNLP Trabajo Social", "UNLPam Sede Central", 
    "UNLPam FCEN", "UNLu Sede San Miguel", "UNLu Sede central y rectorado", 
    "UNMdP Exactas", "UNMdP Medicina", "UNPAZ", "UNQ", "UNR Arquitectura", 
    "UNR Humanidades", "UNR Política", "UNR Psicología", "UNS Edificio Humanidades",
    "UNSa Rectorado", "UNSAM Ciencia y Tecnología", "UNSAM Humanidades", 
    "UNSAM Medicina", "UNSE Cartelazo", "UNSL Humanas", "UNSL Rectorado", 
    "UNSL Psicología", "UNT Artes", "UNT Filo y Letras", "UNT Naturales", "UNT Psicología", 
    "UNTREF Sede Caseros 1", "UNTREF Sede Lynch", "UNCuyo Rectorado", "UNCuyo Facultad de Artes"
  ),
  latitud = c(
    -34.54562, -34.59374, -34.5997, -34.5426, -34.6168, 
    -34.6037, -34.5987, -34.6118, 
    -34.6272, -34.6149, -34.6284, -34.6028,
    -31.417, -31.4175, -31.4158, -31.4165, -31.4149,
    -28.4692, -38.9516, -32.4812, -34.5225,
    -24.1834, -34.6809, -34.9192, -34.9208, 
    -34.9213, -34.9184, -34.9199, -36.6209, 
    -36.6205, -34.5496, -34.5582, 
    -38.0023, -38.0017, -34.7372, -34.7071, 
    -32.9581, -32.9591, -32.9561, -32.9556, 
    -38.7196, -24.7887, -34.5417, -34.5433, 
    -34.5458, -27.7951, -33.2962, -33.2973, 
    -33.3001, -26.8183, -26.8214, -26.8202, -26.8185, 
    -34.6097, -34.6115, -32.8894, -32.8872
  ),
  longitud = c(
    -58.43881, -58.43587, -58.3739, -58.4356, -58.3688, 
    -58.3816, -58.3803, -58.3838, 
    -58.4022, -58.4086, -58.4067, -58.4147,
    -64.183, -64.1829, -64.185, -64.1836, -64.1841,
    -65.7795, -68.058, -60.4822, -58.6986,
    -65.3027, -58.5633, -57.9385, -57.9428, 
    -57.9446, -57.9383, -57.9451, -64.2898, 
    -64.2894, -58.7224, -58.7151, 
    -57.5562, -57.5554, -58.7235, -58.7119, 
    -60.6417, -60.6409, -60.6431, -60.6447, 
    -62.2728, -65.4093, -58.5648, -58.5652, 
    -58.5667, -64.2715, -66.3363, -66.3354, 
    -66.3376, -65.2194, -65.2171, -65.2158, -65.2182, 
    -58.5604, -58.5599, -68.8535, -68.8568
  )
)

# Crear el mapa
mapa <- leaflet(universidades) %>%
  addTiles() %>%
  addMarkers(~longitud, ~latitud, popup = ~nombre)


tabla_html <- paste0(
  "<h3>Universidades en toma</h3>",
  "<table style='width:100%; border: 1px solid black;'>",
  "<tr><th>Universidad</th></tr>",
  paste0(
    "<tr><td>", universidades$nombre, "</td></tr>",
    collapse = ""
  ),
  "</table>"
)

# Crear el mapa con la leyenda y la tabla
mapa <- leaflet(universidades) %>%
  addTiles() %>%
  addMarkers(~longitud, ~latitud, popup = ~nombre) %>%
  addControl(
    html = tabla_html, 
    position = "bottomleft"
  ) %>%
  addControl(
    html = "<h4>#estudiantazo</h4>", 
    position = "topright"
  )

# Mostrar el mapa
mapa



# Guardar el mapa como un archivo HTML
library(htmlwidgets)
saveWidget(mapa, "mapa_universidades1.html", selfcontained = TRUE)
