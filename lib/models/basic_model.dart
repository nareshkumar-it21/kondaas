import 'package:flutter/material.dart';

class BasicModels{
  var generationTotal,lastUpdateTime,usePower,generationPower;

  BasicModels({
     this.generationTotal,
     this.lastUpdateTime,
     this.usePower,
     this.generationPower
});
  factory BasicModels.fromJson(Map<String, dynamic> json) => BasicModels(
      generationPower : json['generationPower'],
      lastUpdateTime : json['lastUpdateTime'],
      usePower : json['usePower'],
      generationTotal : json['generationTotal'],
  );
}