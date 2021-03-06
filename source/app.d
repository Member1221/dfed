import std.stdio;
import backend.settings;
import backend.webfinger;
import vibe.http.router;
import vibe.http.server;
import vibe.web.web;
import vibe.core.core;
import vibe.core.log;
import asdf;


void main()
{
    // Display info about DFed on startup.
    logInfo("=== DFed %s ===", __DATE__);

    // Read config.json, deserialize it and turn the data into an HTTPServerSettings instance.
    // Will force quit application if failed.
    HTTPServerSettings httpSettings = SETTINGS.toServerSettings;

    // Set up the router...
    URLRouter router = new URLRouter;
    router.registerWebInterface(new WebFingerController);


    listenHTTP(httpSettings, router);
    logInfo("DFed started...");

	runApplication();
}
