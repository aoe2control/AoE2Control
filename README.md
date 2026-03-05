# CONTROL Lua Engine for Age of Empires II: DE

CONTROL is a powerful Lua scripting engine that communicates directly with Age of Empires II: Definitive Edition. It allows you to read the internal game state and send commands directly without relying on pixel scanning or mouse/keyboard simulation.

Whether you are building complex custom AI, automating specific game mechanics, or training external machine learning agents via IPC named pipes, CONTROL provides a comprehensive API to make it happen.

**Important:** To protect the integrity of the game's ranking system, this engine is strictly restricted to single-player use. Multiplayer functionality is completely disabled.



## Documentation & Getting Started

To understand the engine's architecture, learn the full API, and write your first module, please visit the official documentation:

**[https://aoe2control.github.io/](https://aoe2control.github.io/)**


## Community & Support

We are building a community of scripters, developers, and AI researchers. If you encounter bugs, have feature requests, or want to share your latest Lua module, please join our Discord server!

**[Join the Discord Server](https://discord.gg/DENDVuWq5t)**



## Installation & Antivirus Notice

Because this engine operates by injecting a DLL into the game process to execute Lua code, heuristic antivirus scanners (including Windows Defender) will likely flag the executable as malicious. This is a false positive inherent to how game modding tools function.

* **Download:** Check the [Releases](../../releases) tab for the latest version.
* **Extraction Password:** `control` *(Archives are password-protected to bypass automated browser/platform blocks).*
* **Action Required:** You will need to add a folder exception in your antivirus settings for the extracted files to allow the engine to run without interruption.

