# Glosario y elementos de datos

## Terminos del Dominio:
### Config
		Configuración de la aplicación
### Profile
		Perfil de twitero.
### VIProfile
		Very importan profile: perfiles de tuiteros que deben ser seguidos porque son importantes para los objetivos de nuestro sistema.
### LastHeartbeat
		Fecha y hora de la última actividad conocida
### LastSeen 
		Ultima vez que fue visto un twitero
### Tweet
		Fragmento de información / Estado de twitter
### TwitterLink
		Relacion EXPLICITA (follower, following, bloqueos) entre dos twiteros, se anota como un arco dirigido, también aplican los conceptos de LastSeen y LastHearbeat. Se puede anotar con tipos (AMIGO, CONOCIDO, GROUPIE, ENTORNO, ENEMIGO)
### TwitterNearness
		Relación INDIRECTA entre dos twiteros, se calcula a través de los TwitterLinks y los TwitterTouchs 
### TwitterTouch
		Interacción en twitter (referencia, favorito, retweet)
### FriendlyTouch
		Interacción entre dos tuiteros unidos por un TwitterLink
### NearTouch
		Interacción entre dos tuiteros con cierto grado de TwitterNearness
### KnownLocation
		Información de geoposicionamiento de un twitero recabada de la API
### KnownClient
		Información sobre el software (implicitamente dispositivos también) que usa un tuitero recabada de la API
### TermOcurrence
		Informe de la aparición en los tweets de un tuitero. También trackea hashtags.
### Domain
		Conjunto de terminos, asociados a un nivel de relevancia que definen un dominio, es decir, que terminos tenemos que buscar si hablamos de un determinado tema y con que nivel de importancia.
### TwitterCluster
		Grupo de twiteros muy conectados y con cierta tasa de interacción.
### Influence
		Metrica de la actividad de un twitero que representa el impacto de sus TwitterTouchs sobre los otros tuiteros de su cluster.
### ClusterLeader
		El lider del cluster se determina tanto por las propiedades graficas del cluster (alta centralidad) como por la Influence
### BelongsToCluster
		Relación de un tuitero con su cluster. Un twitero puede estar en varios clusters
### ActivityProfile
		Metricas de actividad del tuitero (horas a las que twitea, etc)
### ImpactProfile
		Metricas del liderazgo del twitero dentro de temáticas difusas (no clusters) como el diseño, política, etc.
### TargetingProfile
		Metricas de lo interesante que es un tuitero, de cara a seguir su actividad o descartar en un segundo plano.

## Modelado Datos:
	Config:
		Desc:
			Contiene las configuraciones de la aplicacion.
		Campos:
			key: clave
			value: valor
			active: si la configuracion esta activa o no
		Comando:
			rails g model Config key:string value:string active:boolean
	Profile:
		Desc:
			El perfil del usuario
		Campos:
			username: nombre de usuario de twitter
			realname: nombre completo si es posible
			last_seen: la ultima vez que el usuario fue encontrado como "vivo" en la api de twitter (para detectar cancelados)
			last_heartbeat: registro de la última actividad detectada del usuario.
		Comando:
			rails g model Profile username:string realname:string last_seen:datetime last_heartbeat:datetime
	ImpactProfile:
		Campos:
			username: nombre del usuario
			reference_cluster: id del cluster de referencia para este perfil de usuario
			leader_ratio: metrica de liderazgo dentro del cluster de referencia
	InfluenceProfile:
		Campos:
			username: nombre del usuario
			reference_domain: id del dominio de referencia
			influence_ratio: metrica de influencia dentro del dominio de referencia
	TargetingProfile:
		Campos:
			username: nombre del usuario
			ratio: metrica condensada que dice lo interesante que es el usuario
			recommends_to_follow: booleano, recomienda trazar o no a este usuario.