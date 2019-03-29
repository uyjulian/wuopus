
CC = i686-w64-mingw32-gcc
CXX = i686-w64-mingw32-g++
AR = i686-w64-mingw32-ar
ASM = nasm
WINDRES = i686-w64-mingw32-windres
#CFLAGS += -O0 -g
# GIT_HASH = $(shell git rev-parse --short HEAD)
GIT_HASH = nothing
CUR_TIME = $(shell date +%s)
ASMFLAGS += -fwin32 -DWIN32
CFLAGS += -O3 -march=ivybridge -flto
CFLAGS += -Wall -Wno-unused-value -Wno-format -I. -I.. -Ilibogg/include -Iopus/celt -Iopus/include -Iopus/win32 -Iopus/silk -Iopus/silk/fixed -Iopus/silk/float -Iopusfile/include -Iopusfile/src -DGIT_HASH=L\"$(GIT_HASH)\" -DCUR_TIME=L\"$(CUR_TIME)\" -DNDEBUG -DWIN32 -D_WIN32 -D_WINDOWS 
CFLAGS += -DWUOPUS_EXPORTS -DUSE_ALLOCA -DOPUS_BUILD -DHAVE_LRINTF -DHAVE_LRINT -DDECODE_ONLY -D_USRDLL -DMINGW_HAS_SECURE_API -DUNICODE -D_UNICODE -DNO_STRICT -DCMAKE_INTDIR=\"Release\"   
LDFLAGS += -static -static-libstdc++ -static-libgcc -shared -Wl,--kill-at
LDLIBS += -lodbc32 -lodbccp32 -luuid

%.o: %.c
	echo -e "\tCC  $<"
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.cpp
	echo -e "\tCXX  $<"
	$(CXX) -c $(CFLAGS) -o $@ $<

%.o: %.asm
	echo -e "\ASM  $<"
	$(ASM) $(ASMFLAGS) $< -o$@ 

%.o: %.rc
	echo -e "\tWINDRES  $<"
	$(WINDRES) --codepage=65001 $< $@

SOURCES := ../tp_stub.cpp OpusMainUnit.cpp tvpsnd.c libogg/src/bitwise.c libogg/src/framing.c opus/celt/bands.c opus/celt/celt.c opus/celt/celt_decoder.c opus/celt/celt_encoder.c opus/celt/celt_lpc.c opus/celt/cwrs.c opus/celt/entcode.c opus/celt/entdec.c opus/celt/entenc.c opus/celt/kiss_fft.c opus/celt/laplace.c opus/celt/mathops.c opus/celt/mdct.c opus/celt/modes.c opus/celt/pitch.c opus/celt/quant_bands.c opus/celt/rate.c opus/celt/vq.c opus/src/analysis.c opus/src/mlp.c opus/src/mlp_data.c opus/src/opus.c opus/src/opus_compare.c opus/src/opus_decoder.c opus/src/opus_encoder.c opus/src/opus_multistream.c opus/src/opus_multistream_decoder.c opus/src/opus_multistream_encoder.c opus/src/repacketizer.c opus/silk/A2NLSF.c opus/silk/ana_filt_bank_1.c opus/silk/biquad_alt.c opus/silk/bwexpander.c opus/silk/bwexpander_32.c opus/silk/check_control_input.c opus/silk/CNG.c opus/silk/code_signs.c opus/silk/control_audio_bandwidth.c opus/silk/control_codec.c opus/silk/control_SNR.c opus/silk/debug.c opus/silk/decoder_set_fs.c opus/silk/decode_core.c opus/silk/decode_frame.c opus/silk/decode_indices.c opus/silk/decode_parameters.c opus/silk/decode_pitch.c opus/silk/decode_pulses.c opus/silk/dec_API.c opus/silk/encode_indices.c opus/silk/encode_pulses.c opus/silk/enc_API.c opus/silk/gain_quant.c opus/silk/HP_variable_cutoff.c opus/silk/init_decoder.c opus/silk/init_encoder.c opus/silk/inner_prod_aligned.c opus/silk/interpolate.c opus/silk/lin2log.c opus/silk/log2lin.c opus/silk/LPC_analysis_filter.c opus/silk/LPC_inv_pred_gain.c opus/silk/LP_variable_cutoff.c opus/silk/NLSF2A.c opus/silk/NLSF_decode.c opus/silk/NLSF_del_dec_quant.c opus/silk/NLSF_encode.c opus/silk/NLSF_stabilize.c opus/silk/NLSF_unpack.c opus/silk/NLSF_VQ.c opus/silk/NLSF_VQ_weights_laroia.c opus/silk/NSQ.c opus/silk/NSQ_del_dec.c opus/silk/pitch_est_tables.c opus/silk/PLC.c opus/silk/process_NLSFs.c opus/silk/quant_LTP_gains.c opus/silk/resampler.c opus/silk/resampler_down2.c opus/silk/resampler_down2_3.c opus/silk/resampler_private_AR2.c opus/silk/resampler_private_down_FIR.c opus/silk/resampler_private_IIR_FIR.c opus/silk/resampler_private_up2_HQ.c opus/silk/resampler_rom.c opus/silk/shell_coder.c opus/silk/sigm_Q15.c opus/silk/sort.c opus/silk/stereo_decode_pred.c opus/silk/stereo_encode_pred.c opus/silk/stereo_find_predictor.c opus/silk/stereo_LR_to_MS.c opus/silk/stereo_MS_to_LR.c opus/silk/stereo_quant_pred.c opus/silk/sum_sqr_shift.c opus/silk/tables_gain.c opus/silk/tables_LTP.c opus/silk/tables_NLSF_CB_NB_MB.c opus/silk/tables_NLSF_CB_WB.c opus/silk/tables_other.c opus/silk/tables_pitch_lag.c opus/silk/tables_pulses_per_block.c opus/silk/table_LSF_cos.c opus/silk/VAD.c opus/silk/VQ_WMat_EC.c opus/silk/float/apply_sine_window_FLP.c opus/silk/float/autocorrelation_FLP.c opus/silk/float/burg_modified_FLP.c opus/silk/float/bwexpander_FLP.c opus/silk/float/corrMatrix_FLP.c opus/silk/float/encode_frame_FLP.c opus/silk/float/energy_FLP.c opus/silk/float/find_LPC_FLP.c opus/silk/float/find_LTP_FLP.c opus/silk/float/find_pitch_lags_FLP.c opus/silk/float/find_pred_coefs_FLP.c opus/silk/float/inner_product_FLP.c opus/silk/float/k2a_FLP.c opus/silk/float/levinsondurbin_FLP.c opus/silk/float/LPC_analysis_filter_FLP.c opus/silk/float/LPC_inv_pred_gain_FLP.c opus/silk/float/LTP_analysis_filter_FLP.c opus/silk/float/LTP_scale_ctrl_FLP.c opus/silk/float/noise_shape_analysis_FLP.c opus/silk/float/pitch_analysis_core_FLP.c opus/silk/float/prefilter_FLP.c opus/silk/float/process_gains_FLP.c opus/silk/float/regularize_correlations_FLP.c opus/silk/float/residual_energy_FLP.c opus/silk/float/scale_copy_vector_FLP.c opus/silk/float/scale_vector_FLP.c opus/silk/float/schur_FLP.c opus/silk/float/solve_LS_FLP.c opus/silk/float/sort_FLP.c opus/silk/float/warped_autocorrelation_FLP.c opus/silk/float/wrappers_FLP.c opusfile/src/http.c opusfile/src/info.c opusfile/src/internal.c opusfile/src/opusfile.c opusfile/src/stream.c opusfile/src/wincerts.c
# SOURCES += opus/silk/fixed/apply_sine_window_FIX.c opus/silk/fixed/autocorr_FIX.c opus/silk/fixed/burg_modified_FIX.c opus/silk/fixed/corrMatrix_FIX.c opus/silk/fixed/encode_frame_FIX.c opus/silk/fixed/find_LPC_FIX.c opus/silk/fixed/find_LTP_FIX.c opus/silk/fixed/find_pitch_lags_FIX.c opus/silk/fixed/find_pred_coefs_FIX.c opus/silk/fixed/k2a_FIX.c opus/silk/fixed/k2a_Q16_FIX.c opus/silk/fixed/LTP_analysis_filter_FIX.c opus/silk/fixed/LTP_scale_ctrl_FIX.c opus/silk/fixed/noise_shape_analysis_FIX.c opus/silk/fixed/pitch_analysis_core_FIX.c opus/silk/fixed/prefilter_FIX.c opus/silk/fixed/process_gains_FIX.c opus/silk/fixed/regularize_correlations_FIX.c opus/silk/fixed/residual_energy16_FIX.c opus/silk/fixed/residual_energy_FIX.c opus/silk/fixed/schur64_FIX.c opus/silk/fixed/schur_FIX.c opus/silk/fixed/solve_LS_FIX.c opus/silk/fixed/vector_ops_FIX.c opus/silk/fixed/warped_autocorrelation_FIX.c
OBJECTS := $(SOURCES:.c=.o)
OBJECTS := $(OBJECTS:.cpp=.o)
OBJECTS := $(OBJECTS:.asm=.o)
OBJECTS := $(OBJECTS:.rc=.o)

BINARY ?= wuopus.dll
ARCHIVE ?= wuopus.$(GIT_HASH).7z

all: $(BINARY)

archive: $(ARCHIVE)

clean:
	rm -f $(OBJECTS) $(BINARY) $(ARCHIVE)

$(ARCHIVE): $(BINARY) 
	rm -f $(ARCHIVE)
	7z a $@ $^

$(BINARY): $(OBJECTS) 
	@echo -e "\tLNK $@"
	$(CXX) $(CFLAGS) $(LDFLAGS)  -o $@ $^  $(LDLIBS)
