import pickle
from sklearn.ensemble import RandomForestClassifier
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split

# Load your data
df = pd.read_csv('Crop_recommendation.csv')
features = df[['N', 'P', 'K', 'temperature', 'humidity', 'ph', 'rainfall']]
target = df['label']
X_train, X_test, y_train, y_test = train_test_split(features, target, test_size=0.2, random_state=42)

# Train the model
RF = RandomForestClassifier(n_estimators=29, criterion='entropy', random_state=0)
RF.fit(X_train, y_train)

# Save the model
with open('random_forest_model.pkl', 'wb') as model_file:
    pickle.dump(RF, model_file)