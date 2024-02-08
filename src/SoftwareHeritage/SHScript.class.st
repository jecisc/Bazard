Class {
	#name : 'SHScript',
	#superclass : 'Object',
	#category : 'SoftwareHeritage',
	#package : 'SoftwareHeritage'
}

{ #category : 'accessing' }
SHScript >> script [

	| ppProjects origin latest |
	ZnClient new get: 'https://archive.softwareheritage.org/api/1/origin/https://github.com/pharo-project/pharo/visits/'.

	ZnClient new get: 'https://archive.softwareheritage.org/api/1/snapshot/58a9ed1d5ff670d1317710cf9bbedd204763810f'.

	ppProjects := STONJSON fromString: (ZnClient new get: 'https://archive.softwareheritage.org/api/1/origin/search/pharo-project/?with_visit=true').

	origin := (ppProjects at: 14) at: #url.

	latest := STONJSON fromString: (ZnClient new get: 'https://archive.softwareheritage.org/api/1/origin/' , origin , '/visit/latest/').

	STONJSON fromString: (ZnClient new get: 'https://archive.softwareheritage.org/api/1/snapshot/' , (latest at: #snapshot))
]
