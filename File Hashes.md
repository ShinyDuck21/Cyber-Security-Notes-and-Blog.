Get File Hash in PowerShell (default algorithm is SHA-256)
```powershell
Get-FileHash file -alg algorithm
```

Automatically Check if the file hashes are equivalent
```powershell
(Get-FileHash file).hash -eq providedHash
```
