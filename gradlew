package com.example.firebase;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.Query;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.UploadTask;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;

public class MainActivity extends AppCompatActivity
{
    private ImageView imageFoto;
    private Button buttonUpload;
    private FirebaseStorage uploadImage = FirebaseStorage.getInstance();



    /*
    private DatabaseReference referencia = FirebaseDatabase.getInstance().getReference();
    private FirebaseAuth userLogin = FirebaseAuth.getInstance();
     */

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        imageFoto = findViewById(R.id.imageFoto);
        buttonUpload = findViewById(R.id.buttonUpload);

        buttonUpload.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                //Configura para a imagem ser salva na memória
                imageFoto.setDrawingCacheEnabled(true);
                imageFoto.buildDrawingCache();

                //Recupera bitmap da imagem (imagem a ser carregada)
                Bitmap bitmap = imageFoto.getDrawingCache();

                //Comprimo bitmap para um formato png/jpeg
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                bitmap.compress(Bitmap.CompressFormat.JPEG, 75, baos );

                //Converte o baos para pixel brutos em uma matriz de bytes
                //(dados da imagem)
                byte[] dadosImagem = baos.toByteArray();

                //Define nós para o storage
                StorageReference storageReference = FirebaseStorage.getInstance().getReference();
                StorageReference imagens = storageReference.child("imagens");
                StorageReference imagemRef = imagens.child("Celular.jpeg");

                //Retorna objeto que irá controlar o upload
                UploadTask uploadTask = imagemRef.putBytes()
            }
        });



        /************ Aplicando Filtros **************/

        /*


        DatabaseReference usuario = referencia.child("Usuário");

        //DatabaseReference usuarioPesquisa = usuario.child("-MIeXZD7-58f2xtFuIfn"); //filtrar por ID
        //Query usuarioPesquisa = usuario.orderByChild("nome").equalTo("Mariana");  //Ordenar os filhos pelo nome e Realizar pesquisa no banco de dados
        //Query usuarioPesquisa = usuario.orderByKey().limitToLast(3);  //Ordenando por chave e limitando a pesquisa aos dois primeiros resultados

        //Maior ou igual (>=)
        //Query usuarioPesquisa = usuario.orderByChild("idade").startAt(35);

        //Maior ou igual (<=)
        //Query usuarioPesquisa = usuario.orderByChild("idade").endAt(22);

        //Entre dois valores
        //Query usuarioPesquisa = usuario.orderByChild("idade").startAt(18).endAt(30);

        //Filtrar Palavra
        Query usuarioPesquisa = usuario.orderByChild("nome").startAt("M").endAt("M" + "\uf8ff");


        usuarioPesquisa.addValueEventListener(new ValueEventListener()  //adcionando ouvinte
        {
            @Override
            public void onDataChange(@NonNull DataSnapshot dataSnapshot)
            {
                Log.i("Dados Usuário: ", dataSnapshot.getValue().toString());
            }

            @Override
            public void onCancelled(@NonNull DatabaseError databaseError)
            {

            }
        });


        */


        /************ Gerando Identificador Unico **************/

        /*
        DatabaseReference usuario = referencia.child("Usuário");

        Usuarios usuarios = new Usuarios("Valmy", "Ribeiro", 20);
        Usuarios usuarios1 = new Usuarios("Mariana", "Silvério", 45);
        Usuarios usuarios2 = new Usuarios("Marcelo", "Farias", 18);
        Usuarios usuarios3 = new Usuarios("Ana", "Ribeiro", 22);
        Usuarios usuarios4= new Usuarios("Rodrigo", "Matos", 35);

        usuario.push().setValue(usuarios1);
        usuario.push().setValue(usuarios2);
        usuario.push().setValue(usuarios3);
        usuario.push().setValue(usuarios4);

        */


        /************ logar Usuário **************/

        /*

        userLogin.signInWithEm