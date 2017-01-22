as yet unclassified
deploy: aVersion
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