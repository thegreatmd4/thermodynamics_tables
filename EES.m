function output = EES(O, I1n,I1, I2n,I2, R, Type)
% Designed by Mahdi Robati 1398- University of Tehran
if Type=='i'
    switch O
        case 'T'
            O1='Temperature';
            if I1n=='H'
                fid=fopen('C:\EESTEMP\MACRO.emf','w');
                fprintf(fid,"Open 'C:\\EESTEMP\\EESCODE.TXT'\nUnits SI K Pa J Mass Rad\nImport 'C:\\EESTEMP\\INPUT.dat' R$ %s\nSolve\nExport 'C:\\EESTEMP\\OUTPUT.dat' %s\nQuit",I1n,O);
                fclose(fid);

                fid=fopen('C:\EESTEMP\EESCODE.TXT','w');   
                fprintf(fid,"{$DS.}%s=%s(R$,%s)\n",O,O1,[I1n '=' I1n]);
                fclose(fid);

                fid=fopen('C:\EESTEMP\INPUT.dat','w');   
                fprintf(fid,'''%s'' %f',R,I1);
                fclose(fid);
            else 
                fid=fopen('C:\EESTEMP\MACRO.emf','w');
                fprintf(fid,"Open 'C:\\EESTEMP\\EESCODE.TXT'\nUnits SI K Pa J Mass Rad\nImport 'C:\\EESTEMP\\INPUT.dat' R$ %s\nSolve\nExport 'C:\\EESTEMP\\OUTPUT.dat' %s\nQuit",[I1n ' ' I2n],O);
                fclose(fid);

                fid=fopen('C:\EESTEMP\EESCODE.TXT','w');   
                fprintf(fid,"{$DS.}%s=%s(R$,%s,%s)\n",O,O1,[I1n '=' I1n],[I2n '=' I2n]);
                fclose(fid);

                fid=fopen('C:\EESTEMP\INPUT.dat','w');   
                fprintf(fid,'''%s'' %f %f',R,I1,I2);
                fclose(fid);
            end                
        case 'P'
            O1='Pressure';
            fid=fopen('C:\EESTEMP\MACRO.emf','w');
            fprintf(fid,"Open 'C:\\EESTEMP\\EESCODE.TXT'\nUnits SI K Pa J Mass Rad\nImport 'C:\\EESTEMP\\INPUT.dat' R$ %s\nSolve\nExport 'C:\\EESTEMP\\OUTPUT.dat' %s\nQuit",[I1n ' ' I2n],O);
            fclose(fid);

            fid=fopen('C:\EESTEMP\EESCODE.TXT','w');   
            fprintf(fid,"{$DS.}%s=%s(R$,%s,%s)\n",O,O1,[I1n '=' I1n],[I2n '=' I2n]);
            fclose(fid);

            fid=fopen('C:\EESTEMP\INPUT.dat','w');   
            fprintf(fid,'''%s'' %f %f',R,I1,I2);
            fclose(fid);
        case 'S'
            O1='Entropy';
            fid=fopen('C:\EESTEMP\MACRO.emf','w');
            fprintf(fid,"Open 'C:\\EESTEMP\\EESCODE.TXT'\nUnits SI K Pa J Mass Rad\nImport 'C:\\EESTEMP\\INPUT.dat' R$ %s\nSolve\nExport 'C:\\EESTEMP\\OUTPUT.dat' %s\nQuit",[I1n ' ' I2n],O);
            fclose(fid);

            fid=fopen('C:\EESTEMP\EESCODE.TXT','w');   
            fprintf(fid,"{$DS.}%s=%s(R$,%s,%s)\n",O,O1,[I1n '=' I1n],[I2n '=' I2n]);
            fclose(fid);

            fid=fopen('C:\EESTEMP\INPUT.dat','w');   
            fprintf(fid,'''%s'' %f %f',R,I1,I2);
            fclose(fid);
        case 'H'
            O1='Enthalpy';
            fid=fopen('C:\EESTEMP\MACRO.emf','w');
            fprintf(fid,"Open 'C:\\EESTEMP\\EESCODE.TXT'\nUnits SI K Pa J Mass Rad\nImport 'C:\\EESTEMP\\INPUT.dat' R$ %s\nSolve\nExport 'C:\\EESTEMP\\OUTPUT.dat' %s\nQuit",I1n,O);
            fclose(fid);

            fid=fopen('C:\EESTEMP\EESCODE.TXT','w');   
            fprintf(fid,"{$DS.}%s=%s(R$,%s)\n",O,O1,[I1n '=' I1n]);
            fclose(fid);

            fid=fopen('C:\EESTEMP\INPUT.dat','w');   
            fprintf(fid,'''%s'' %f %f',R,I1);
            fclose(fid);
    end
else
    if Type=='r'
        switch O
        case 'T'
            O1='Temperature';
        case 'P'
            O1='Pressure';
        case 'S'
            O1='Entropy';
        case 'H'
            O1='Enthalpy';
    end
    
    fid=fopen('C:\EESTEMP\MACRO.emf','w');
    fprintf(fid,"Open 'C:\\EESTEMP\\EESCODE.TXT'\nUnits SI K Pa J Mass Rad\nImport 'C:\\EESTEMP\\INPUT.dat' R$ %s\nSolve\nExport 'C:\\EESTEMP\\OUTPUT.dat' %s\nQuit",[I1n,' ',I2n],O);
    fclose(fid);
    
    fid=fopen('C:\EESTEMP\EESCODE.TXT','w');   
    fprintf(fid,"{$DS.}%s=%s(R$,%s,%s)\n",O,O1,[I1n,'=',I1n],[I2n,'=',I2n]);
    fclose(fid);
    
    fid=fopen('C:\EESTEMP\INPUT.dat','w');   
    fprintf(fid,'''%s'' %f %f',R,I1,I2);
    fclose(fid);

    end
end
    
    system("C:\EES32\ees.exe  C:\EESTEMP\MACRO.emf");
    
    output=importdata('C:\EESTEMP\OUTPUT.dat');
end