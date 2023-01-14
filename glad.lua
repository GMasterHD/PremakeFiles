project "glad"
	language "C"
	kind "StaticLib"
	systemversion "latest"
	location("%{wks.location}/"..cfg_locations["glad"])

	targetdir("%{wks.location}/bin/"..cfg_outdirTemplate)
	objdir("%{wks.location}/bin-int/"..cfg_outdirTemplate)

	includedirs {
		"%{prj.location}/include/"
	}
	files {
		"%{prj.location}/src/glad.c"
	}

	filter "configurations:Debug*"
		symbols "On"
		optimize "Off"

	filter "configurations:Release*"
		symbols "On"
		optimize "Debug"

	filter "configurations:Dist*"
		symbols "Off"
		optimize "Speed"
