package main.User;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient
public class Client {
    @FeignClient(name = "user-service", url = "")
    public interface UserClient {
        @PostMapping(value = "/auth", produces = MediaType.APPLICATION_JSON_VALUE)

    }
}
