local projectName = "google_test"
local mainProjectName = "google_test_main"

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
	
	-- Google Test Code Files include other Code Files
	includedirs
	{
		"include",
		".",
	}

	-- Files that should be included into this project
	files
	{
		"include/**.h",
		"src/gtest-all.cc",
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
		IncludeDirs[mainProjectName] = path.join(os.getcwd(), 'include')
	end

	-- Include directories
	includedirs
	{
		"include",
	}

	-- Files that should be included into this project
	files
	{
		"src/gtest_main.cc",
	}
	
	links
	{
		projectName
	}

