<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;
use App\Models\Buku;
use Illuminate\Http\Request;

class BukuController extends Controller
{
    public function storeBook(Request $request){
        $buku = Buku::create([
            'judul' => $request->judul,
            'penulis' => $request->penulis,
            'penerbit' => $request->penerbit,
            'tahun_terbit' => $request->tahun_terbit,
            'img' => $request->img,
            'katagori' => $request->katagori,
        ]);

        if($buku){
            return response()->json(['status' => 200, 'message'=> 'success', 'data' => $buku]);
        }else{
            return response()->json(['status' => 300]);
        }
    }

    public function show(){
        $data = Buku::all();

        if($data){
            return response()->json(['status' => 200, 'message'=> 'success', 'data' => $data]);
        }else{
            return response()->json(['status' => 300]);
        }
    }
}
