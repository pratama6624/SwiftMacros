
# This repository is part of a journey to learn Swift for the Apple Developer Ecosystem

Towards the main repo [Swift Fundamental](https://github.com/pratama6624/PratamaSwiftStudyJourney/blob/main/Road/SwiftFundamental/README.md)  

## Apa Itu Swift Macros?
Swift Macros adalah cara untuk **menghasilkan kode secara otomatis** waktu compile-time.  
Alih-alih nulis kode berulang-ulang, kita bisa bikin macro yang *expand* jadi kode nyata saat di-compile.  
Dengan ini, kita bisa:
- Mengurangi boilerplate.
- Menjaga konsistensi.
- Bikin API lebih expressive.

---

## Kenapa Ada Parameter `raw`, `names`, dan `conformances`?

Saat bikin macro, Swift compiler kasih kita informasi tambahan biar macro bisa "ngerti konteks" dari target yang ditempeli.

### 1. `raw`
- Isinya: representasi **mentah (raw)** dari kode target dalam bentuk syntax tree.  
- Kegunaan:  
  Kita bisa "baca" seluruh isi kode, atribut, fungsi, properti, atau annotation.  
  Ibaratnya ini cermin yang nunjukin struktur asli kode kita.

### 2. `names`
- Isinya: semua **nama yang ada di kode target** (variabel, fungsi, struct, enum, dll).  
- Kegunaan:  
  Supaya macro bisa tau ada apa aja di dalam kode target, misalnya:
  - Generate fungsi tambahan dengan nama yang tidak bentrok.
  - Validasi apakah nama tertentu sudah ada atau belum.

### 3. `conformances`
- Isinya: semua **protocol yang diadopsi** oleh target.  
- Kegunaan:
  - Macro bisa generate kode tambahan hanya kalau tipe tersebut memenuhi protocol tertentu.
  - Misalnya kalau `Equatable`, macro bisa bantu generate `==` otomatis.

---

## Contoh Analogi

Bayangin lagi bikin macro untuk struct:

```swift
@MyMacro
struct User {
    let id: Int
    let name: String
}
```

# Ringkasan Belajar Swift Macros  

Ringkasan ini adalah catatan perjalanan gue memahami **Swift Macros**.  
Menurut gue, macro di Swift itu game-changer banget karena bikin coding lebih efisien tanpa harus nulis boilerplate berkali-kali.  

---

## Poin Penting yang Gue Pelajari  

- ✅ **Macro = buat programmer “malas tapi pintar”** → fokus ke logic bisnis, bukan boilerplate.  
- ✅ **Macro nerapin konsep DRY (Don’t Repeat Yourself) secara ekstrem** → tulis sekali, hasilnya bisa otomatis di-generate.  
- ✅ **Macro jalan di compile-time** → hasil akhirnya sama kayak nulis manual, jadi gak ada perbedaan performa di runtime.  
- ✅ **Compile-time overhead itu nyata** → kalau macro terlalu kompleks, build bisa agak berat.  
- ✅ **Masih ada keterbatasan** → contoh rewrite function lewat macro masih agak struggling.  
- ✅ **Ruang eksperimen luas** → kita bisa eksplorasi beyond dokumentasi resmi Apple.  
- ✅ **Apple sendiri udah pake Macro** → contoh: `@Observable`, `@freestanding(expression) #filePath`, dll.  
- ✅ **Ngurangin boilerplate code** → bikin kode lebih clean, rapi, dan gampang dibaca.  
- ✅ **Cara kerja dasar Macro** → expand kode pas compile, hasilnya tetap Swift biasa.  
- ✅ **Kelebihan utama** → coding lebih cepat, minim repetisi, maintainability lebih oke.  
- ✅ **Trade-off** → proses build bisa lebih berat karena compiler harus expand macro.  
- ✅ **Lingkungan belajar** → bisa di VSCode (via CLI) tapi paling smooth pakai Xcode.  
- ✅ **Relevan banget buat Apple Developer/iOS Dev** → bikin project lebih scalable.  
- ✅ **Next step** → latihan bikin macro custom biar makin paham cara kerja internalnya.  

---

**Kesimpulan:**  
> Swift Macros = senjata untuk programmer produktif.  
> Bukan buat males-malesan, tapi biar fokus ke hal yang lebih penting: **logic bisnis & pengalaman user**.  
