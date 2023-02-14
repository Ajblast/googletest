project "GoogleTest"
	kind "StaticLib"	-- SharedLib for .lib
	language "C++"		-- C++
	cppdialect "C++20"	-- C++17
	staticruntime "on"	-- MultiThreaded

	targ = "..\\..\\bin\\" .. outputdir .. "\\" .. "GoogleTest"
	targetdir (targ)
	out = "..\\..\\bin-int\\" .. outputdir .. "\\" .. "GoogleTest"
	objdir (out)

	-- Files that should be included into this project
	files
	{
		"googletest/include/**",
		"googletest/src/gtest-all.cc",
	}

	-- Define the following
	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	-- Include directories
	includedirs
	{
		"googletest",
		"googletest/include",
	}

	-- When the system is windows
	filter "system:windows"
		systemversion "latest"

	-- When the configuration is debug
	filter "configurations:Debug"
		runtime "Debug"				-- Debug runtime optimization
		symbols "on"				-- Generate debug symbols
		
	-- When the configuration is Release
	filter "configurations:Release"
		runtime "Release"			-- Release runtime optimization
		optimize "on"				-- Optimize the project (Balanced)
		
project "GoogleTestMain"
	kind "StaticLib"	-- SharedLib for .lib
	language "C++"		-- C++
	cppdialect "C++20"	-- C++17
	staticruntime "on"	-- MultiThreaded

	targ = "..\\..\\bin\\" .. outputdir .. "\\" .. "GoogleTestMain"
	targetdir (targ)
	out = "..\\..\\bin-int\\" .. outputdir .. "\\" .. "GoogleTestMain"
	objdir (out)

	-- Files that should be included into this project
	files
	{
		"googletest/src/gtest_main.cc",
	}
	
	links
	{
		"GoogleTest"
	}

	-- Define the following
	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	-- Include directories
	includedirs
	{
		"googletest/include",
	}

	-- When the system is windows
	filter "system:windows"
		systemversion "latest"

	-- When the configuration is debug
	filter "configurations:Debug"
		runtime "Debug"				-- Debug runtime optimization
		symbols "on"				-- Generate debug symbols
		
	-- When the configuration is Release
	filter "configurations:Release"
		runtime "Release"			-- Release runtime optimization
		optimize "on"				-- Optimize the project (Balanced)
