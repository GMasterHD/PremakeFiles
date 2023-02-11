project "spdlog"
	language "C++"
	kind "StaticLib"
	systemversion "latest"
	location("%{wks.location}/"..cfg_locations["spdlog"])

	targetdir("%{wks.location}/bin/"..cfg_outdirTemplate)
	objdir("%{wks.location}/bin-int/"..cfg_outdirTemplate)

	defines {
		"SPDLOG_COMPILED_LIB"
	}

	includedirs {
		"%{prj.location}/include/"
	}
	files {
		"%{prj.location}/src/async.cpp",
		"%{prj.location}/src/cfg.cpp",
		"%{prj.location}/src/color_sinks.cpp",
		"%{prj.location}/src/file_sinks.cpp",
		"%{prj.location}/src/fmt.cpp",
		"%{prj.location}/src/spdlog.cpp",
		"%{prj.location}/src/stdout_sinks.cpp"
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
