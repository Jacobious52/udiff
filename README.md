# udiff
Unique union diff tool

Example output of 4 files

```
86 90       | 86 90       | 86 90       | 86 90       | 86 90      
59 86       |             | 59 86       | 59 86       | 59 86      
34 59       |             | 34 59       | 34 59       | 34 59      
39 86       | 39 86       | 39 86       | 39 86       | 39 86      
85 90       | 85 90       | 85 90       | 85 90       | 85 90      
34 85       | 34 85       | 34 85       | 34 85       | 34 85      
36 85 90    | 36 85 90    | 36 85 90    | 36 85 90    | 36 85 90   
            |             | 39 86 90    |             | 39 86 90   
34 85 86    | 34 85 86    | 34 85 86    | 34 85 86    | 34 85 86   
            | 34 67 85    |             |             |            
            | 67 85 86    |             |             |            
36 86 90    | 36 86 90    | 36 86 90    | 36 86 90    | 36 86 90   
34 36 90    | 34 36 90    | 34 36 90    | 34 36 90    | 34 36 90   
            |             | 36 39 85    |             |            
34 36 85    | 34 36 85    | 34 36 85    | 34 36 85    | 34 36 85   
85 86 90    | 85 86 90    | 85 86 90    | 85 86 90    | 85 86 90   
39 85 90    |             | 39 85 90    | 39 85 90    | 39 85 90   
39 85 86    | 39 85 86    | 39 85 86    | 39 85 86    | 39 85 86   
34 59 86    |             | 34 59 86    | 34 59 86    | 34 59 86   
36 85 86    | 36 85 86    | 36 85 86    | 36 85 86    | 36 85 86   
            |             | 34 39 90    |             | 34 39 90   
```

or 

```
85 90       |  ✅  |  ✅  |  ✅  |  ✅  |  ✅ 
34 85       |  ✅  |  ✅  |  ✅  |  ✅  |  ✅ 
36 85 90    |  ✅  |  ✅  |  ✅  |  ✅  |  ✅ 
39 86 90    |  ❌  |  ❌  |  ✅  |  ❌  |  ✅ 
34 85 86    |  ✅  |  ✅  |  ✅  |  ✅  |  ✅ 
34 67 85    |  ❌  |  ✅  |  ❌  |  ❌  |  ❌ 
67 85 86    |  ❌  |  ✅  |  ❌  |  ❌  |  ❌ 
36 86 90    |  ✅  |  ✅  |  ✅  |  ✅  |  ✅ 
34 36 90    |  ✅  |  ✅  |  ✅  |  ✅  |  ✅ 
36 39 85    |  ❌  |  ❌  |  ✅  |  ❌  |  ❌ 
34 36 85    |  ✅  |  ✅  |  ✅  |  ✅  |  ✅ 
85 86 90    |  ✅  |  ✅  |  ✅  |  ✅  |  ✅ 
39 85 90    |  ✅  |  ❌  |  ✅  |  ✅  |  ✅ 
39 85 86    |  ✅  |  ✅  |  ✅  |  ✅  |  ✅ 
34 59 86    |  ✅  |  ❌  |  ✅  |  ✅  |  ✅ 
36 85 86    |  ✅  |  ✅  |  ✅  |  ✅  |  ✅ 
```