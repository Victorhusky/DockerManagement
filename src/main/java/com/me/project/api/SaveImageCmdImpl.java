package com.me.project.api;

import java.io.InputStream;

import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Response;


public class SaveImageCmdImpl extends DockerCommand {

    public SaveImageCmdImpl(String url) {
        super(url);
    }

    @Override
    public Object exec(Object... commands) {
        if (commands.length < 1)
            return null;
        String id = (String) commands[0];
        WebTarget webResource = getResource().path("/images/{id}/get")
                .resolveTemplate("id", id);

        return webResource.request().get(Response.class)
                .readEntity(InputStream.class);
    }

}
