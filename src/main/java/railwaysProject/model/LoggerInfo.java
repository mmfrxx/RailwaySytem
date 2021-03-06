package railwaysProject.model;

import railwaysProject.view.ApiRequestInfo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class LoggerInfo {

    private List<ApiRequestInfo> logs;

    public LoggerInfo() {
        logs = new ArrayList<>();
    }

    public void addLogs(ApiRequestInfo log) {
        logs.add(log);

        if (logs.size() > 20) {
            logs.remove(0);
        }
    }


    public String getLogs() {
        List<String> logsFinal = new ArrayList<>();
        for (ApiRequestInfo log: logs) {
            logsFinal.add(log.toString());
        }
        Collections.reverse(logsFinal);
        return logsFinal.toString();
    }


}
