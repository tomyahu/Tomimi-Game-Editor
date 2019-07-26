require "lib.classes.class"
local Arrays = require "lib.structures.algorithm.Arrays"
--------------------------------------------------------------------------------------------------------

-- class: NaiveBayesClassifier
-- param: number_of_characteristics:int -> the number of characteristics of the samples
-- param: number_of_classes:int -> the number of classes of the samples
-- A naive bayes classifier
local NaiveBayesClassifier = class(function(self, number_of_characteristics, number_of_classes)
    self.number_of_characteristics = number_of_characteristics
    self.number_of_classes = number_of_classes

    self.class_probs = nil
    self.characteristic_probs = nil
end)

-- train: list(list(any)), list(int), int -> None
-- trains the model
function NaiveBayesClassifier.train(self, training_data, training_classes, total_samples)
    local class_number = {}
    for i=1, self.number_of_classes do
        class_number[i] = 0
    end

    local characteristic_number = {}
    for i=1, self.number_of_characteristics do
        characteristic_number[i] = {}
        for j=1, self.number_of_classes do
            characteristic_number[i][j] = {}
        end
    end

    for _, class in pairs(training_classes) do
        class_number[class] = class_number[class] + 1
    end

    for i=1, total_samples do
        for j=1, self.number_of_characteristics do
            if characteristic_number[j][training_classes[i]][training_data[i][j]] == nil then
                characteristic_number[j][training_classes[i]][training_data[i][j]] = 0
            end
            characteristic_number[j][training_classes[i]][training_data[i][j]] = characteristic_number[j][training_classes[i]][training_data[i][j]] + 1
        end
    end

    for i=1, self.number_of_characteristics do
        for j=1, self.number_of_classes do
            for x, _ in pairs(characteristic_number[i][j]) do
                characteristic_number[i][j][x] = characteristic_number[i][j][x]/class_number[j]
            end
        end
    end

    for i=1, self.number_of_classes do
        class_number[i] = class_number[i]/total_samples
    end

    self.class_probs = class_number
    self.characteristic_probs = characteristic_number
end

-- predict: list(any) -> int
-- takes a list of characteristics and predicts the class that is going to use
function NaiveBayesClassifier.predict(self, characteristics)
    local classes_probs = {}
    for i=1, self.number_of_classes do
        local acc = self.class_probs[i]
        for j = 1, self.number_of_characteristics do
            if self.characteristic_probs[j][i][characteristics[j]] == nil then
                acc = 0
            else
                acc = acc * self.characteristic_probs[j][i][characteristics[j]]
            end
        end

        classes_probs[i] = acc
    end

    local class, prob = Arrays:max(classes_probs)
end

return NaiveBayesClassifier