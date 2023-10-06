Class {
	#name : 'SystemEventPrinter',
	#superclass : 'Object',
	#category : 'SystemEventPrinter',
	#package : 'SystemEventPrinter'
}

{ #category : 'tools registry' }
SystemEventPrinter class >> register [

	<script>
	self unsubcribe.

	SystemAnnouncer uniqueInstance
		when: PackageAdded do: [ :ann | ('Package added: ' , ann package name) traceCr ] for: self;
		when: PackageRemoved do: [ :ann | ('Package removed ' , ann package name) traceCr ] for: self;
		when: PackageRenamed do: [ :ann | ('Package renamed: ' , ann package name) traceCr ] for: self;
		when: PackageTagAdded do: [ :ann | ('Package tag added: ' , ann tag name , ' in ' , ann package name) traceCr ] for: self;
		when: PackageTagRemoved do: [ :ann | ('Package tag removed ' , ann tag name , ' in ' , ann package name) traceCr ] for: self;
		when: PackageTagRenamed do: [ :ann | ('Package tag renamed: ' , ann tag name , ' in ' , ann package name) traceCr ] for: self;
		when: CategoryAdded do: [ :ann | ('Category added: ' , ann categoryName) traceCr ] for: self;
		when: CategoryRemoved do: [ :ann | ('Category removed ' , ann categoryName) traceCr ] for: self;
		when: CategoryRenamed do: [ :ann | ('Category renamed from: ' , ann oldCategoryName , ' to: ' , ann newCategoryName) traceCr ] for: self;
		when: ClassRecategorized
		do: [ :ann | ('Category of: ' , ann classAffected name , ' changed from: ' , ann oldCategory , ' to: ' , ann newCategory) traceCr ]
		for: self;
		when: ClassRepackaged
		do: [ :ann | ('Package tag of: ' , ann classAffected name , ' changed from: ' , ann oldCategory , ' to: ' , ann newCategory) traceCr ]
		for: self.

	Transcript ensureOpen
]

{ #category : 'tools registry' }
SystemEventPrinter class >> unsubcribe [

	<script>
	SystemAnnouncer uniqueInstance unsubscribe: self
]
