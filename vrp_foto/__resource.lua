resource_manifest_version "77731fab-63ca-442c-a67b-abc70f28dfa5"

description "hyp_fart -- credit til https://github.com/DreanorGTA5Mods/StationaryRadar"

dependency "vrp"

client_scripts{ 
  "Proxy.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}