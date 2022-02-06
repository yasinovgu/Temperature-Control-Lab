function y = opcua_read_write_data_to_server(u)

persistent uaClient heater_1 heater_2 input_1 input_2 kp ki CO1 CO2 CE1 CE2

if (isempty(uaClient))
uaClient = opcua('localhost', 4840);
setSecurityModel(uaClient,'None');
connect(uaClient);
heater_1 = findNodeByName(uaClient.Namespace, 'Output: actualTemperature_1');
%heater_2 = findNodeByName(uaClient.Namespace, 'Output: actualTemperature_2');
input_1 = findNodeByName(uaClient.Namespace, 'Input: Temperature_1');
%input_2 = findNodeByName(uaClient.Namespace, 'Input: Temperature_2');
kp = findNodeByName(uaClient.Namespace, 'Proportional: Kp');
ki = findNodeByName(uaClient.Namespace, 'Integral: Ki');
CO1 = findNodeByName(uaClient.Namespace, 'ManipulatedVariable_1');
%CO2 = findNodeByName(uaClient.Namespace, 'ManipulatedVariable_2');
CE1 = findNodeByName(uaClient.Namespace, 'ControllerError_1');
%CE2 = findNodeByName(uaClient.Namespace, 'ControllerError_2');
y=[30;1.6;0.0088];%evt. auskommentieren
%writeValue(heater_1, 0);
%writeValue(heater_2, 0);

else
y=[30;1.6;0.0088];
writeValue(CE1, u(1));
writeValue(CO1, u(2));
%writeValue(CO2, u(3));
writeValue(heater_1, u(4));
%writeValue(heater_2, u(5));
writeValue(kp, u(6));
writeValue(ki, u(7));
[val1,ts1,qual1] = readValue(input_1);
[val2,ts2,qual2] = readValue(kp);
[val3,ts3,qual3] = readValue(ki);
y=[val1;val2;val3];
end

end