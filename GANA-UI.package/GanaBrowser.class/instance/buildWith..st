building
buildWith: builder

	^ builder build: (builder pluggableWindowSpec new
		model: self;
		label: #labelString;
		children: {self buildCommitTree: builder.
					self buildSearchBar: builder.
					self buildHelpForSearch: builder.
					self buildRepositorySelectionButton: builder})