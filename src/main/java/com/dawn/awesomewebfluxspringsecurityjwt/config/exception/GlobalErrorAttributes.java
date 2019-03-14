package com.dawn.awesomewebfluxspringsecurityjwt.config.exception;

import lombok.extern.log4j.Log4j2;
import org.springframework.boot.web.reactive.error.DefaultErrorAttributes;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.server.ResponseStatusException;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Author: Administrator
 * DATE: 2019/2/1
 * DESC:
 **/
@Log4j2
@Component
public class GlobalErrorAttributes extends DefaultErrorAttributes {

    public GlobalErrorAttributes() {
        super(false);
    }

    @Override
    public Map<String, Object> getErrorAttributes(ServerRequest request, boolean includeStackTrace) {
        return assembleError(request);
    }

    private Map<String, Object> assembleError(ServerRequest request) {
        Map<String, Object> errorAttributes = new LinkedHashMap<>();
        Throwable error = getError(request);
        errorAttributes.put("timestamp", new Date());
        errorAttributes.put("path", request.path());
        if (error instanceof ResponseStatusException) {
            errorAttributes.put("status", ((ResponseStatusException) error).getStatus().value());
            errorAttributes.put("message", ((ResponseStatusException) error).getReason());
        } else if (error instanceof CommonException) {
            errorAttributes.put("code", ((CommonException) error).getCode());
            errorAttributes.put("status", HttpStatus.OK.value());
            errorAttributes.put("message", ((CommonException) error).getMsg());
        } else {
            log.error(error);
            error.printStackTrace();
            errorAttributes.put("status", HttpStatus.INTERNAL_SERVER_ERROR.value());
            errorAttributes.put("message", HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase());
        }
        return errorAttributes;
    }
}