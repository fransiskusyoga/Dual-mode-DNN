function [hiddenWeights, outputWeights] = train(activationFunction, dActivationFunction, numberOfHiddenUnits, inputValues, targetValues, epochs, batchSize, learningRate)

    % Ukuran matriks trainingSet, input, dan output
    trainingSetSize = size(inputValues, 2);
    inputDimensions = size(inputValues, 1);
    outputDimensions = size(targetValues, 1);
    
    % Inisialisasi hidden weights dan output weights
	% dengan nilai random yang ternormalisasi antara 0..1
    hiddenWeights = rand(numberOfHiddenUnits, inputDimensions);
    outputWeights = rand(outputDimensions, numberOfHiddenUnits);
    
    hiddenWeights = hiddenWeights./size(hiddenWeights, 2);
    outputWeights = outputWeights./size(outputWeights, 2);
    
    costgraph = zeros(epochs);
    for t = 1: epochs
        tavg_hw = 0;
        tavg_ow = 0;
        tavg_hai = 0;
        tavg_oai = 0;
        tavg_od = 0;
        tavg_hd = 0;
        temp = 0;
        for n = 1: batchSize
            % Forward propagate
            inputVector = inputValues(:, n);
            hiddenActualInput = hiddenWeights*inputVector;
            hiddenOutputVector = activationFunction(hiddenActualInput);
            outputActualInput = outputWeights*hiddenOutputVector;
            outputVector = activationFunction(outputActualInput);
            
            targetVector = targetValues(:, n);
            
            % Backpropagation
            outputDelta = dActivationFunction(outputActualInput).*(outputVector - targetVector);
            hiddenDelta = dActivationFunction(hiddenActualInput).*(outputWeights'*outputDelta);
            
            outputWeights = outputWeights - learningRate.*outputDelta*hiddenOutputVector';
            hiddenWeights = hiddenWeights - learningRate.*hiddenDelta*inputVector';
            temp = temp + sum(abs(outputVector - targetVector));

        end;
		fprintf('Epoch: ');
        disp(t);
        costgraph(t)=temp; 
    end;
    figure, plot(costgraph);
end

