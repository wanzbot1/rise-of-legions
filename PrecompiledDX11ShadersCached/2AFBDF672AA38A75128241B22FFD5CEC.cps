DXBCлЕ╠░!%█Ъ∙<d╠ЛbЇ╝   ■d     8   ь  t  и  ╝  8  RDEFм     l             x  \                             c                            global local ллл\   
   Ь              c      X  Ё           М      @       Ф      д  @   @       Ф      п  А         ─      ╘  Р          ь      №  а          ─        ░          ─        └          ─        ╨          ─      '  р          ─      7  Ё          H      View ллл            Projection DirectionalLightDir л            DirectionalLightColor лл            Ambient CameraPosition CameraUp CameraLeft CameraDirection viewport_size ллл            и      @       Ф      о  @   @       Ф      ─  А         ─      ╥  М          р      Ё  Р          ь      ∙  а                  ░          ь      $  └          р      1  ─          р      >  ╚                M  ╠          р      V  ╨          р      [  ╘          ─      k  р          ─      World WorldInverseTranspose LightPosition AlphaTestRef л             co_color co_additive ллл             ghost_color ghost_factor ghost_offset ghost_additive progress glow object_position fading_color Microsoft (R) HLSL Shader Compiler 9.29.952.3111 лллISGNА         h                    t                   t                   t                   SV_POSITION TEXCOORD лллOSGN,                               SV_TARGET ллSHDR  @   C   Y  FО      	   Y  FО     	   b r    e  Є      h     6  r      FАA         r      F     FВ                FВ         F     6        
 АA          B      
      @    zD6  ▓      @                  6  Є      F     >  STATt                                                                                                                 SDBG╛]  T   Ц8  ╟8  ╫8                   p  	   °  Q   ╨  	   $  H   ╪  8#  М$      -   -   ╡7      6                                              А                               А                               А                                                                                                                                                                                                                                                N          4                                                            А     А   А                      А     А   А                      А     А   А                                                                                                                                                                                                                                       N          4                                                            А     А   А                                                                                                                                                                                                                                                                                                              N          4     @     6                                                А     А   А                                                                                                                                                                                                                                                                                                              O          H                                                                                                                                    А     А   А                                                                                                                                                                                                                                      O          H             6                                                                                                                                                                                                                                                                                                                                                                        O          H             6                                                                                                                  А     А   А                                                                                                                                                                                                                                     P          H             >                                                                                                                                                                                                                                                                                                                                                                               P          H          L                     L                    L                    M              -       M              -      M              -      H              E       H              E      H              E      H              E      H              E      H              E      H              E      H              E      H              E      H              E   	   H              E   
   H              E      I              D       I              D      I              D      I              D      K              F       K              F      K              F      K              F      J              G       
                                                                                                                                                                                            Е  	      я7      Ж  	      8      И        8      Л        %8      Т  	      =8      У  	      N8      Х        d8      Ш        p8               п            
   ╡         	      ╦         	      ъ         	               	                     .         #   
   8         /      D         	      _               Ъ       %               )         9      1      !   Й      =         Э      D         	      K         М	      _         s      u         }      }         '               B      Л               Н         <      Ь         D      н         n      ╡         +      ├      	   ╡      ╦         й      ё   
      Ц      Є   
      ╦      є   
             Ї   
      5      ї   
      j      Ў   
      Я      ў   
      ╘      ·         ,      ■         h              е              ф      
        $              d              д      #        ▒       -        =!      -        D!      .  	      e!      /        }!      6  	      ╪!      7        ъ!      9  	      "      :        "      :        '"      ;        ="      =        X"      =        b"      >  	      r"      ?  	      Н"      E        ╨"      в  	      ф+      Ў  	      А6      Я  	      З8      Ў  !      Ш6      ў        л6      ■        O7      Ў  !      Ш6      Ў  	      А6      ■        O7      ў        л6         	      ╦      .  	      e!      ■                                                   a)               Ж*              к+                т7     <   $      к+               щ7             А6             щ7              А6        (                                         	                                       
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           !                                      "                                      #                                      $                                       %                                       &                                       '                                       (                                       )                                       *                                       +                                       ,                                       -                                       .                                       /                                       0                                       1                                       2                                       3                                       4                                       5                                      6                                        7                                       8                                        9                                       :                                        ;                                        <                                        =                                        >                                        ?                                       @                                       A                           T                                                                                                                                                                                                                                                                                                                                  D                                       B                                         C                                       E                                        F                                        G                                       :   ;   <   =   >   ?   @   A   B                               	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   C   D   F   E   F   F   G   E   F   G               G            D:\ProgrammierenSVN\Base Conflict\pixelshader#define DX11
#define DIFFUSETEXTURE
#define SKINNING
#define FORCE_TEXCOORD_INPUT
#define FORCE_NORMALMAPPING_INPUT
#define FORCE_SKINNING_INPUT

///////////////////////////////////////////////////////////////////////////////
/////// Shaderglobals.fx
///////////////////////////////////////////////////////////////////////////////
cbuffer global : register(b0)
{
  float4x4 View, Projection;
  float3 DirectionalLightDir;
  float4 DirectionalLightColor;
  float3 Ambient;
  float3 CameraPosition, CameraUp, CameraLeft, CameraDirection;
  float2 viewport_size;
};

#define MAX_BONES 66

static const float PI = 3.14159265f;

#define GAUSS_0 {0.44198, 0.27901}
#define GAUSS_1 {0.250301, 0.221461, 0.153388}
#define GAUSS_2 {0.214607, 0.189879, 0.131514, 0.071303}
#define GAUSS_3 {0.20236, 0.179044, 0.124009, 0.067234, 0.028532}
#define GAUSS_4 {0.198596, 0.175713, 0.121703, 0.065984, 0.028002, 0.0093}

#define GAUSS_0_ADDITIVE {1.0, 0.63127}
#define GAUSS_1_ADDITIVE {1.0, 0.88478, 0.61281}
#define GAUSS_2_ADDITIVE {1.0, 0.88478, 0.61281, 0.33224}
#define GAUSS_3_ADDITIVE {1.0, 0.88478, 0.61281, 0.33224, 0.14099}
#define GAUSS_4_ADDITIVE {1.0, 0.88478, 0.61281, 0.33224, 0.14099, 0.04683}

float sqr(float value){
  return value*value;
}

float3 BeleuchtungsBerechnung(float3 Normale,float3 Licht){
  //normale Beleuchtung + Ambient
  //Berechnung ist physikalisch falsch sieht aber besser aus
  float Diffus = saturate(dot(Normale,Licht))*1.5;
  float InverseDiffus = saturate(dot(Normale,-Licht))*1.5;
  return (Diffus+Ambient*(InverseDiffus-Diffus+1)+Ambient);
}

float3 BeleuchtungsBerechnungMitSchatten(float3 Normale,float3 Licht, float Shadowstrength){
  //normale Beleuchtung + Ambient
  //Berechnung ist physikalisch falsch sieht aber besser aus
  float Diffus = saturate(dot(Normale,Licht))*1.5 * (1-Shadowstrength);
  float InverseDiffus = saturate(dot(Normale,-Licht))*1.5;
  return (Diffus+Ambient*(InverseDiffus-Diffus+1)+Ambient);
}

/////////////////////////////////////////////
// HSV //////////////////////////////////////
/////////////////////////////////////////////

float MinComponent(float3 v)
{
    float t = (v.x<v.y) ? v.x : v.y;
    t = (t<v.z) ? t : v.z;
    return t;
}

float MaxComponent(float3 v)
{
    float t = (v.x>v.y) ? v.x : v.y;
    t = (t>v.z) ? t : v.z;
    return t;
}

float3 RGBToHSV(float3 RGB)
{
    float3 HSV = 0;
    float minVal = MinComponent(RGB);
    float maxVal = MaxComponent(RGB);
    float delta = maxVal - minVal;             
    HSV.z = maxVal;
    if (delta != 0) {            // If gray, leave H & S at zero
       HSV.y = delta / maxVal;
       float3 delRGB;
       delRGB = ( ( ( maxVal.xxx - RGB ) / 6.0 ) + ( delta / 2.0 ) ) / delta;
       if      ( RGB.x == maxVal ) HSV.x = delRGB.z - delRGB.y;
       else if ( RGB.y == maxVal ) HSV.x = ( 1.0/3.0) + delRGB.x - delRGB.z;
       else if ( RGB.z == maxVal ) HSV.x = ( 2.0/3.0) + delRGB.y - delRGB.x;
       if ( HSV.x < 0.0 ) { HSV.x += 1.0; }
       if ( HSV.x > 1.0 ) { HSV.x -= 1.0; }
    }
    return (HSV);
}

float3 HSVToRGB(float3 HSV)
{
    float3 RGB = HSV.z;
    if ( HSV.y != 0 ) {
       float var_h = HSV.x * 6;
       float f = frac(var_h);
       float p = HSV.z * (1.0 - HSV.y);
       float q = HSV.z * (1.0 - HSV.y * f);
       float t = HSV.z * (1.0 - HSV.y * (1.0 - f));
       if      (var_h < 1) { RGB = float3(HSV.z, t, p); }
       else if (var_h < 2) { RGB = float3(q, HSV.z, p); }
       else if (var_h < 3) { RGB = float3(p, HSV.z, t); }
       else if (var_h < 4) { RGB = float3(p, q, HSV.z); }
       else if (var_h < 5) { RGB = float3(t, p, HSV.z); }
       else if (var_h < 6) { RGB = float3(HSV.z, p, q); }
       else                { RGB = float3(HSV.z, t, p); }
   }
   return (RGB);
}

// from : http://www.chilliant.com/rgb2hsv.html

float3 HUEtoRGB(in float H)
{
  float R = abs(H * 6 - 3) - 1;
  float G = 2 - abs(H * 6 - 2);
  float B = 2 - abs(H * 6 - 4);
  return saturate(float3(R,G,B));
}

float Epsilon = 1e-10;

float3 RGBtoHCV(in float3 RGB)
{
  // Based on work by Sam Hocevar and Emil Persson
  float4 P = (RGB.g < RGB.b) ? float4(RGB.bg, -1.0, 2.0/3.0) : float4(RGB.gb, 0.0, -1.0/3.0);
  float4 Q = (RGB.r < P.x) ? float4(P.xyw, RGB.r) : float4(RGB.r, P.yzx);
  float C = Q.x - min(Q.w, Q.y);
  float H = abs((Q.w - Q.y) / (6 * C + Epsilon) + Q.z);
  return float3(H, C, Q.x);
}

// The weights of RGB contributions to luminance.
// Should sum to unity.
float3 HCYwts = float3(0.299, 0.587, 0.114);

float3 HCYtoRGB(in float3 HCY)
{
  float3 RGB = HUEtoRGB(HCY.x);
  float Z = dot(RGB, HCYwts);
  if (HCY.z < Z)
  {
      HCY.y *= HCY.z / Z;
  }
  else if (Z < 1)
  {
      HCY.y *= (1 - HCY.z) / (1 - Z);
  }
  return (RGB - Z) * HCY.y + HCY.z;
}

float3 RGBtoHCY(in float3 RGB)
{
  float3 HCV = RGBtoHCV(RGB);
  float Y = dot(RGB, HCYwts);
  if (HCV.y != 0)
  {
    float Z = dot(HUEtoRGB(HCV.x), HCYwts);
    if (Y > Z)
    {
      Y = 1 - Y;
      Z = 1 - Z;
    }
    HCV.y *= Z / Y;
  }
  return float3(HCV.x, HCV.y, Y);
}

float3 RGBtoHSL(in float3 RGB)
{
  float3 HCV = RGBtoHCV(RGB);
  float L = HCV.z - HCV.y * 0.5;
  float S = HCV.y / (1 - abs(L * 2 - 1) + Epsilon);
  return float3(HCV.x, S, L);
}

float3 HSLtoRGB(in float3 HSL)
{
  float3 RGB = HUEtoRGB(HSL.x);
  float C = (1 - abs(2 * HSL.z - 1)) * HSL.y;
  return (RGB - 0.5) * C + HSL.z;
}

/////////////////////////////////////////////
// Generate texturecoordinates //////////////
/////////////////////////////////////////////

/*
  Converts a Normal to a texturecoordinate for a sphere with only a normal 2D-Texture.
*/
float2 SphereMap(float3 Normal)
{
   return float2(atan2(Normal.x,Normal.z)/(2*PI) + 0.5,(asin(-Normal.y)/PI + 0.5));
}

/*
  Converts a Normal to a texturecoordinate for a cubemap with only a normal 2D-Texture. Should be optimized.
*/
float2 CubeMap(float3 Normal){
  float2 newTex;
  float3 absNormal = float3(abs(Normal.x),abs(Normal.y),abs(Normal.z));
  float3 tempNormal = (Normal / max(absNormal.x,max(absNormal.y,absNormal.z)));
  if (absNormal.z>=absNormal.x) {
    if (absNormal.y>=absNormal.x) {
      if (absNormal.z>=absNormal.y) {
        newTex.x = -tempNormal.x*sign(tempNormal.z);
        newTex.y = -tempNormal.y;
      } else {
        newTex.x = tempNormal.x*sign(tempNormal.y);
        newTex.y = tempNormal.z;
      }
    } else {
      newTex.x = -tempNormal.x*sign(tempNormal.z);
      newTex.y = -tempNormal.y;
    }
    } else {
    if (absNormal.x>=absNormal.y) {
      if (absNormal.z>=absNormal.y) {
        newTex.x = tempNormal.z*sign(tempNormal.x);
        newTex.y = -tempNormal.y;
      } else {
        newTex.x = tempNormal.z*sign(tempNormal.x);
        newTex.y = -tempNormal.y;
      }
    } else {
      newTex.x = tempNormal.x*sign(tempNormal.y);
      newTex.y = tempNormal.z;
    }
  }
	return (newTex*0.5+0.5);
}

///////////////////////////////////////////////////////////////////////////////
/////// Shadertextures.fx
///////////////////////////////////////////////////////////////////////////////
//Texturslots
Texture2D ColorTexture : register(t0);      //Slot0
Texture2D NormalTexture : register(t1);     //Slot1
Texture2D MaterialTexture : register(t2);   //Slot2
Texture2D VariableTexture1 : register(t3);  //Slot3
Texture2D VariableTexture2 : register(t4);  //Slot4
Texture2D VariableTexture3 : register(t5);  //Slot5
Texture2D VariableTexture4 : register(t6);  //Slot6

//SamplerState for texture access
sampler ColorTextureSampler : register(s0)
{
  
};
SamplerState NormalTextureSampler : register(s1)
{
  
};
SamplerState MaterialTextureSampler : register(s2)
{
  
};
SamplerState VariableTexture1Sampler : register(s3)
{
  
};
SamplerState VariableTexture2Sampler : register(s4)
{
  
};
SamplerState VariableTexture3Sampler : register(s5)
{
  
};
SamplerState VariableTexture4Sampler : register(s6)
{
  
};



    
  #define SMOOTHED_NORMAL

  #define FALL_HEIGHT 4.0
  #define SPHERE_RADIUS 0.15
  #define GLOW_STRENGTH 0.8
  #define FALL_FINISH 0.1
  #define SEED_FINISH 0.4
  #define GROW_FINISH 0.7

  float powlerp(float x){
    float t = x - 1;
    return t*t*t*t*t + 1;
  }


#undef LIGHTING

cbuffer local : register(b1)
{
  float4x4 World, WorldInverseTranspose;
  float3 LightPosition;
  float AlphaTestRef;

  #ifdef MORPH
    float4 Morphweights[2];
  #endif

      
  float4 co_color;
  bool co_additive;

  float4 ghost_color;
  float ghost_factor, ghost_offset;
  bool ghost_additive;

  float progress, glow;
  float3 object_position;
  float3 fading_color;

};

cbuffer bones : register(b2)
{
  float4x3 BoneTransforms[MAX_BONES];
};


#ifdef SKINNING
  // number of influencing bones per vertex in range [1, 4]
  #define NumBoneInfluences 4
#endif

struct VSInput
{
    float3 Position : POSITION0;
    #ifdef MORPH
      #if MORPH_COUNT > 0
        float3 Position_Morph_1 : POSITION1;
      #endif
      #if MORPH_COUNT > 1
        float3 Position_Morph_2 : POSITION2;
      #endif
      #if MORPH_COUNT > 2
        float3 Position_Morph_3 : POSITION3;
      #endif
      #if MORPH_COUNT > 3
        float3 Position_Morph_4 : POSITION4;
      #endif
      #if MORPH_COUNT > 4
        float3 Position_Morph_5 : POSITION5;
      #endif
      #if MORPH_COUNT > 5
        float3 Position_Morph_6 : POSITION6;
      #endif
      #if MORPH_COUNT > 6
        float3 Position_Morph_7 : POSITION7;
      #endif
      #if MORPH_COUNT > 7
        float3 Position_Morph_8 : POSITION8;
      #endif
    #endif
    #ifdef VERTEXCOLOR
      float4 Color : COLOR0;
    #endif
    #if defined(DIFFUSETEXTURE) || defined(NORMALMAPPING) || defined(MATERIAL) || defined(FORCE_TEXCOORD_INPUT)
      float2 Tex : TEXCOORD0;
    #endif
    #if defined(LIGHTING) || defined(FORCE_NORMALMAPPING_INPUT)
      float3 Normal : NORMAL0;
      #if defined(NORMALMAPPING) || defined(FORCE_NORMALMAPPING_INPUT)
        float3 Tangent : TANGENT0;
        float3 Binormal : BINORMAL0;
      #endif
    #endif

    #if defined(SKINNING) || defined(FORCE_SKINNING_INPUT)
      float4 BoneWeights : BLENDWEIGHT0;
      float4 BoneIndices : BLENDINDICES0;
    #endif
    #ifdef SMOOTHED_NORMAL
      float3 SmoothedNormal : TEXCOORD7;
    #endif

};

struct VSOutput
{
  float4 Position : SV_POSITION0;
  float3 WorldPosition : TEXCOORD0;
  #if defined(DIFFUSETEXTURE) || defined(NORMALMAPPING) || defined(MATERIAL)
    float2 Tex : TEXCOORD1;
  #endif
  #ifdef SMOOTHED_NORMAL
    float3 SmoothedNormal : TEXCOORD7;
  #endif

};

struct PSInput
{
  float4 Position : SV_POSITION0;
  float3 WorldPosition : TEXCOORD0;
  #if defined(DIFFUSETEXTURE) || defined(NORMALMAPPING) || defined(MATERIAL)
    float2 Tex : TEXCOORD1;
  #endif
  #ifdef SMOOTHED_NORMAL
    float3 SmoothedNormal : TEXCOORD7;
  #endif

};

struct PSOutput
{
  float4 Color : SV_TARGET0;
};

VSOutput MegaVertexShader(VSInput vsin){
  VSOutput vsout;


  float4 pos = float4(vsin.Position, 1.0);
  #ifdef MORPH
    #if MORPH_COUNT > 0
      pos.xyz += vsin.Position_Morph_1 * Morphweights[0][0];
    #endif
    #if MORPH_COUNT > 1
      pos.xyz += vsin.Position_Morph_2 * Morphweights[0][1];
    #endif
    #if MORPH_COUNT > 2
      pos.xyz += vsin.Position_Morph_3 * Morphweights[0][2];
    #endif
    #if MORPH_COUNT > 3
      pos.xyz += vsin.Position_Morph_4 * Morphweights[0][3];
    #endif
    #if MORPH_COUNT > 4
      pos.xyz += vsin.Position_Morph_5 * Morphweights[1][0];
    #endif
    #if MORPH_COUNT > 5
      pos.xyz += vsin.Position_Morph_6 * Morphweights[1][1];
    #endif
    #if MORPH_COUNT > 6
      pos.xyz += vsin.Position_Morph_7 * Morphweights[1][2];
    #endif
    #if MORPH_COUNT > 7
      pos.xyz += vsin.Position_Morph_8 * Morphweights[1][3];
    #endif
  #endif

  #ifdef SKINNING
    float4x3 skinning = 0;

    [unroll]
    for (int i = 0; i < NumBoneInfluences; i++) {
      skinning += vsin.BoneWeights[i] * BoneTransforms[vsin.BoneIndices[i]];
    }

    pos.xyz = mul((float3x3)skinning, pos.xyz) + skinning._41_42_43;
  #endif

  #ifdef SMOOTHED_NORMAL
    #ifdef SKINNING
      float3 SmoothedNormal = mul((float3x3)skinning, vsin.SmoothedNormal);
    #else
      float3 SmoothedNormal = vsin.SmoothedNormal;
    #endif
    SmoothedNormal = normalize(mul((float3x3)WorldInverseTranspose, normalize(SmoothedNormal)));
  #endif

    float4 Worldposition = mul(World, pos);

  float3 center = object_position;
  center.y += SPHERE_RADIUS * 2;
  float3 between = Worldposition.xyz - center;
  float fall_factor = saturate(progress / FALL_FINISH);
  float seed_factor = saturate((progress - FALL_FINISH) / (SEED_FINISH - FALL_FINISH));
  float grow_factor = saturate((progress - SEED_FINISH) / (GROW_FINISH - SEED_FINISH));

  float3 between_factor = 1 / lerp(length(between) / (SPHERE_RADIUS * lerp(2, 3, seed_factor)), 1.0, powlerp(grow_factor));
  float spawn_factor = powlerp(fall_factor) * 0.5 + 0.5;
  float squash_factor = (1 - sin(PI * saturate(seed_factor * 3))) * 0.3 + 0.7;
  Worldposition.xyz = center + between * between_factor * spawn_factor * float3(1 / squash_factor, squash_factor, 1 / squash_factor);

  Worldposition.y += lerp(FALL_HEIGHT, 0, fall_factor);


  #if defined(DIFFUSETEXTURE) || defined(NORMALMAPPING) || defined(MATERIAL)
    vsout.Tex = vsin.Tex;
  #endif

  vsout.Position = mul(Projection, mul(View, Worldposition));
  vsout.WorldPosition = Worldposition.xyz;

  #ifdef SMOOTHED_NORMAL
    vsout.SmoothedNormal = SmoothedNormal;
  #endif


  return vsout;
}

PSOutput MegaPixelShader(PSInput psin){
  PSOutput pso;

  #if defined(ALPHATEST) && defined(DIFFUSETEXTURE)
    clip(ColorTexture.Sample(ColorTextureSampler,  psin.Tex).a - AlphaTestRef);
  #endif


  float distance = dot(DirectionalLightDir, LightPosition - psin.WorldPosition);
  pso.Color = float4(0, 0, 1000.0 - distance, 0);

  return pso;
}

GlobalsLocalsVSOutput::PositionVSOutput::WorldPositionVSOutput::TexVSOutput::SmoothedNormalPSInput::PositionPSInput::WorldPositionPSInput::TexPSInput::SmoothedNormalPSOutput::ColorMicrosoft (R) HLSL Shader Compiler 9.29.952.3111 MegaPixelShader ps_4_0 