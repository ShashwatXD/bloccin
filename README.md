```mermaid

graph TD;
    A[MainLayout Widget] --> B[Product BLoC];
    A --> C[Form BLoC];
    A --> D[Music BLoC];
    B --> E[Product Model];
    C --> F[Form Model];
    D --> G[Music Model];
    B --> H[Product Screen];
    C --> I[Form Screen];
    D --> J[Audio Player Screen];
    H --> K[Product Details];
    I --> L[Form Details];
    K --> M[API Call for Product Details];
    L --> N[API Call for Form Details];
    M --> O[Display Product Details];
    N --> P[Display Form Details];
    O --> Q[Product Screen];
    P --> R[Form Screen];
