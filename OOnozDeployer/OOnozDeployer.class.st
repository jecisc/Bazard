Class {
	#name : #OOnozDeployer,
	#superclass : #WARequestHandler,
	#category : 'OOnozDeployer'
}

{ #category : #initialization }
OOnozDeployer class >> initialize [
	WAAdmin register: self at: 'deploy'.
	ZnConstants defaultMaximumEntitySize: 40 * 1024 * 1024
]

{ #category : #'as yet unclassified' }
OOnozDeployer >> deploy: aVersion [
	| folder archive |
	folder := (FileLocator home / 'images')
		ensureCreateDirectory;
		yourself.
	archive := (folder / 'OOnoz.zip')
		ensureDelete;
		yourself.
	ZnClient new
		url: 'https://ci.inria.fr/pharo-contribution/job/OOnoz/PHARO=60,VERSION=' , aVersion , '/lastSuccessfulBuild/artifact/OOnoz.zip';
		downloadTo: archive.
	ZipArchive new
		readFrom: archive;
		extractAllTo: folder overwrite: true
]

{ #category : #handling }
OOnozDeployer >> handleFiltered: aContext [
	(Duration seconds: 200) wait.
	aContext request at: 'version' ifPresent: [ :version | self deploy: version ]
]
