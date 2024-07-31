import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.metrics import classification_report
from sklearn import metrics
from sklearn import tree
import warnings

warnings.filterwarnings('ignore')

# Replace '/content/Crop_recommendation.csv' with the correct path
df = pd.read_csv('Crop_recommendation.csv')
print(df.head())
features = df[['N','P','K','temperature','humidity','ph','rainfall']]
target = df['label']
acc = []
model = []
from sklearn.model_selection import train_test_split
X_train,X_test,y_train,y_test=train_test_split(features,target,test_size=0.2,random_state=42)
from sklearn.ensemble import RandomForestClassifier
RF = RandomForestClassifier(n_estimators=29, criterion = 'entropy',random_state=0)
RF.fit(X_train,y_train)
predicted = RF.predict(X_test)
x = metrics.accuracy_score(y_test,predicted)
acc.append(x)
model.append('Random Forest')
print("Random Forest Accuracy is ",x * 100)
print(classification_report(y_test,predicted))
data = np.array([[80,42, 43, 10.603016, 60.3, 6.7, 140.91]])
prediction = RF.predict(data)
print(prediction)

