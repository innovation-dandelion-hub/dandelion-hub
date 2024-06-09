![Banner](./assets/imgs/banner.png)

# Dandelion Hub 🌼

Esta solución fue desarrollada para el desafío ejecutivo 'Hack for Cross Agency Knowledge Management' del hackatón 'Innovation Challenge' organizado por Microsoft.

"Dandelion Hub" (DH) es una plataforma revolucionaria de gestión de datos diseñada para fomentar la colaboración y el intercambio de conocimientos entre agencias gubernamentales. 🏦

Inspirada en el ciclo de vida de un diente de león, nuestra plataforma transforma diversas fuentes de datos en informes y visualizaciones informativas, al igual que un diente de león transforma el agua en una hermosa flor que puede reproducirse a través del aire. 🍃

Con Datadelion, las agencias gubernamentales pueden aprovechar el poder de los datos para tomar decisiones informadas, impulsar la innovación y, en última instancia, mejorar la vida de los ciudadanos, funcionando como un puente entre países utilizando la tecnología como enlace.

Nuestra plataforma permite una integración de datos sin interrupciones, análisis avanzados y un intercambio de información seguro, empoderando a las agencias para florecer y difundir su conocimiento como semillas de diente de león en el viento. Permitiendo a todos acceder a los datos desde cualquier lugar en una sola plataforma. 🗺️

## Arquitectura

Este proyecto utiliza diversas herramientas y servicios de Microsoft Azure para recopilar, procesar, analizar y visualizar datos provenientes de múltiples fuentes gubernamentales. El siguiente diagrama presenta la arquitectura de la solución.

![Banner](./assets/imgs/diagrama.png)

### Componentes

1. **Azure Data Factory**: Recopila datos de diversas fuentes gubernamentales a través de un pipeline que consume las APIs, asegurando una ingestión de datos continua, automatizada y escalable.

2. **Azure Cosmos DB**: Los datos recopilados se almacenan en Azure Cosmos DB, una base de datos NoSQL, que permite un acceso rápido y flexible a la información.

3. **Azure Machine Learning**: Se utilizan modelos de aprendizaje automático en Azure Machine Learning para procesar y estandarizar los datos. Las técnicas aplicadas incluyen:

   - Regresión Lineal
   - Clustering

4. **Azure Prompt Flow**: Permite implementar bloqueos cuando la información proporcionada por los usuarios difiere de los datos almacenados en nuestras fuentes verificadas.

5. **Azure Blob Storage**: Los datos procesados y los resultados intermedios se almacenan en Azure Blob Storage, que maneja grandes volúmenes de datos de manera eficiente.

6. **Azure OpenAI Service**: Implementa modelos de inteligencia artificial avanzados para generar insights y responder a consultas de los usuarios.

7. **Azure Search**: Facilita la búsqueda y recuperación eficiente de datos procesados, permitiendo a los usuarios encontrar la información necesario de manera rápida y efectiva.

8. **Microsoft Power BI Embedded**: Proporciona capacidades avanzadas de visualización de datos que se integran directamente en nuestro sitio web, ofreciendo una experiencia interactiva y visualmente atractiva.

9. **Microsoft Copilot Studio**: Permite a los usuarios interactuar ocon los datos a través de un chatbot, generando gráficos automatizados y reportes visuales para facilitar la comprensión y el análisis de información.

### Flujo de datos

1. **Ingestión de Datos**: Azure Data Factory recopila datos de varias APIs gubernamentales.

2. **Almacenamiento**: Los datos se almacenan en Azure Cosmos DB.

3. **Procesamiento**: Azure Machine Learning estandariza los datos, además, puede aplicar técnicas de regresión lineal y clustering.

4. **Almacenamiento intermedio**: Los resultados del procesamiento se almacenan en Azure Blob Storage.

5. **Análisis avanzado**: Azure OpenAI Service genera insights adicionales a partir de los datos procesados.

6. **Búsqueda**: Azure Search permite la recuperación eficiente de los datos.

7. **Visualización**: Mediante Power BI Embedded, se proporcionan visualizaciones integradas en el sitio web.

8. **Interacción**: Se ofrecen 3 opciones para interactuar

   - Microsoft Teams: A través de una integración basada en Microsoft Power Apps, los usuarios pueden interactuar con el chatbot a través de Teams.

   - Versión Web: Los usuarios pueden acceder a la plataforma a través de una aplicación web.

     - Esta versión web hace uso de Microsoft Power Pages, Azure Blob Storage y Azure Virtual Machine para ser desplegada.

   - Versión Copiloto: Los usuarios pueden interactuar con el chatbot a través de Copilot Studio.

9. **Validación de datos**: A través de Azure Prompt Flow se implementan bloqueos y notificaciones para garantizar la fidelidad de los datos introducidos por los usuarios.
