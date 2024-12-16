program projek_uas_labdaspro;
uses crt;

type data_matkul = record
nama: string;
durasi: integer;
selesai: boolean;
nomor: integer;
end;

var
data : array [1..10] of data_matkul;
choice, count: integer;


procedure TambahMapel(var sesi: array of data_matkul; var count: integer);

    var
    nama: string;
    n,i, durasi: integer;

    begin
        writeln;
        write('Berapa banyak mapel? '); readln(n);
        writeln('');
        for i:= 1 to n do
        begin
            begin
            write('Nama Mata Pelajaran: '); readln(nama);
            write('Durasi Belajar (menit): '); readln(durasi);
            writeln('');

            inc(count);
            sesi[count].nama:= nama;
            sesi[count].durasi:= durasi;
            sesi[count].nomor:= count;
            end;
        end;

        clrscr;
        writeln;
        writeln('(Mata Pelajaran Berhasil Ditambahkan!)');
        writeln('');
    end;

procedure TampilData(var sesi: array of data_matkul; var count: integer);

    var
    i: integer;

    begin
        for i:= 1 to count do
            with sesi[i] do
            begin
            writeln(nomor,'.');
            writeln('Nama Matkul: ', nama);
            writeln('Durasi sesi: ', durasi);

            if selesai then
            writeln(' (SELESAI)');
            writeln('');
            end;
    end;

procedure SelesaiSesi(var sesi: array of data_matkul; count: integer);
    var
        i, choice: integer;

    begin
        for i := 1 to count do
            if not sesi[i].selesai then
                begin
                writeln;
                writeln(sesi[i].nomor,'.');
                writeln('Nama Matkul: ', sesi[i].nama);
                writeln('Durasi sesi: ', sesi[i].durasi);
                end;

        writeln;
        writeln('Pilih sesi belajar yang telah selesai:');
        readln(choice);

        if (choice >= 1) and (choice <= count) then
        begin
            if not sesi[choice].selesai then
            begin
                sesi[choice].selesai := true;
                clrscr;
                writeln('(Sesi belajar berhasil ditandai sebagai selesai.)');
            end
            else
                begin
                clrscr;
                writeln('(Sesi belajar ini sudah selesai.)');
                end
        end
        else
            begin
            clrscr;
            writeln('(Pilihan anda tidak valid.)');
            end
    end;

function TotalDurasi(var sesi: array of data_matkul; count: integer):integer; 
    var
    i, totalwaktu: integer;

    begin
        totalwaktu:= 0;
        for i:= 1 to count do
            totalwaktu:= totalwaktu + sesi[i].durasi;
        
        totaldurasi:= totalwaktu;
    end;
    
begin
    clrscr;
    repeat
        writeln('======== Selamat Datang di Program  ========');
        writeln('====== Study Time Management System ========');
        writeln('1. Tambah Sesi Belajar');
        writeln('2. Tandai Sesi Belajar Telah Selesai');
        writeln('3. Daftar Sesi Belajar');
        Writeln('4. Exit');
        write('Pilihan: '); readln(choice);

        case choice of
            1: TambahMapel(data, count); //prosedur untuk menambahkan mapel
                
            2: SelesaiSesi(data, count); //prosedur untuk menyelesaikan sesi

            3:  begin
                    clrscr;
                    TampilData(data,count); //Prosedur untuk menampilan data mapel

                    writeln('=======================================');
                    writeln('Total Durasi: ',TotalDurasi(data, count)); //Fungsi Total Durasi yang mentotalkan durasi semua sesi
                    
                    writeln;
                    write('Back'); readln();
                    clrscr;
                end;

            4:  begin
                clrscr;
                writeln('===========================================');
                writeln('Terima kasih telah menggunakan program ini!');
                writeln('===========================================');
                end;
        else
            writeln('(Pilihan tidak valid)');
        end;
        writeln;
    until choice = 4;
end.