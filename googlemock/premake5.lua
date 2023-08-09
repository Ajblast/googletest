local projectName = "google_mock"
local mainProjectName = "google_mock_main"

project(projectName)
	kind "StaticLib"

	-- If the project location function is defined, then set the
	-- location
	-- targetdir
	-- objdir
	if project_location then
		project_location()
	end

	-- If the IncludeDirs is defines, add this project to the list
	if IncludeDirs then	
		IncludeDirs[projectName] = path.join(os.getcwd(), 'include')
	end

	-- Google Mock Code Files include other Code Files
	includedirs
	{
		".",
		"include",
		"%{IncludeDirs.google_test}",	
	}
	
	-- Files that should be included into this project
	files
	{
		"include/**",
		"src/gmock-all.cc",
	}
	
	links
	{
		"google_test"
	}
		
project(mainProjectName)
	kind "StaticLib"

	-- If the project location function is defined, then set the
	-- location
	-- targetdir
	-- objdir
	if project_location then
		project_location()
	end

	-- If the IncludeDirs is defines, add this project to the list
	if IncludeDirs then	
		IncludeDirs[projectName] = path.join(os.getcwd(), 'include')
	end
	
	-- Include directories
	includedirs
	{
		"include",
		"%{IncludeDirs.google_test}",
	}

	-- Files that should be included into this project
	files
	{
		"src/gmock_main.cc",
	}
	
	links
	{
		"google_test",
		projectName,
	}


