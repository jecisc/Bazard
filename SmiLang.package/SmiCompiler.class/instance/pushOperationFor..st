private
pushOperationFor: name
	^ SmiPushTemp new tempIndex: (self tempIndexFor: name)